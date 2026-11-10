// Connect the GPS Power pin to 5V
// Connect the GPS Ground pin to ground
// Connect the GPS TX (transmit) pin to Digital 8
// Connect the GPS RX (receive) pin to Digital 7

#include <Adafruit_GPS.h>
#include <SoftwareSerial.h>
#include <string>                                                                                   
#include <stdio.h>
#include <new>
#include <math.h>

using namespace std;

// you can change the pin numbers to match your wiring:
SoftwareSerial mySerial(2, 0);
Adafruit_GPS GPS(&mySerial);

string rmcDate, currentDate;
string rmcTime, currentTime;
double latitudeCurrent, longitudeCurrent;

float **tracking;
float **trackingPrevious;
int rowsTracking;

void calculateCurrentLocation(double temporaryLat, double temporaryLong){
  int latSignChange;
  int lonSignChange;

  if(GPS.lat == 'N') {
    latSignChange = 1;
  }
  else {
    latSignChange = -1;
  }
  if(GPS.lon == 'E') {
    lonSignChange = -1;
  }
  else {
    lonSignChange = 1;
  }

  double minutesLat;
  double minutesLong;
  double degreesLat;
  double degreesLong;
  double secondsLat;
  double secondsLong;
  double millisecondsLat;
  double millisecondsLong;

  degreesLat = trunc(temporaryLat/100);
  minutesLat = temporaryLat - (degreesLat*100);
  secondsLat = (minutesLat - trunc(minutesLat)) * 100;
  millisecondsLat = (secondsLat - trunc(secondsLat)) * 100;

  degreesLong = trunc(temporaryLong/100);
  minutesLong = temporaryLong - (degreesLong*100);
  secondsLong = (minutesLong - trunc(minutesLong)) * 100;
  millisecondsLong = (secondsLong - trunc(secondsLong)) * 100;

  minutesLat = trunc(minutesLat);
  secondsLat = trunc(secondsLat);
  millisecondsLat = trunc(millisecondsLat);

  minutesLong = trunc(minutesLong);
  secondsLong = trunc(secondsLong);
  millisecondsLong = trunc(millisecondsLong);

  latitudeCurrent = degreesLat + minutesLat/60 + secondsLat/3600 + millisecondsLat/3600000;
  longitudeCurrent = degreesLong + minutesLong/60 + secondsLong/3600 + millisecondsLong/3600000;
  latitudeCurrent *= latSignChange;
  longitudeCurrent *= lonSignChange;
}

vector<string> split_string(const string& str, const char& ch) {
  string next;
  vector<string> result;

  // For each character in the string
  for (string::const_iterator it = str.begin(); it != str.end(); it++) {
      // If we've hit the terminal character
      if (*it == ch) {
          // If we have some characters accumulated
          if (!next.empty()) {
              // Add them to the result vector
              result.push_back(next);
              next.clear();
          }
      } else {
          // Accumulate the next character into the sequence
          next += *it;
      }
  }
  if (!next.empty())
        result.push_back(next);
  return result;
}

void setup() {
  // delay(120000);
  delay(5000);
  Serial.begin(57600);
  delay(5000);
  Serial.println("ScintPi lite");
  GPS.begin(9600);
  delay(100);
  // NMEA Checksum Calculator
  // https://nmeachecksum.eqth.net/
  GPS.sendCommand("$PMTK251,57600*2C");
  mySerial.flush();
  mySerial.end();
  delay(100);
  GPS.begin(57600);
  delay(100);
  GPS.sendCommand("$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29");
  GPS.sendCommand("$PMTK220,100*2F");
  // selects the NMEA information the GPS sensor should output over serial
  // reference: https://www.adafruit.com/datasheets/PMTK_A11.pdf
  GPS.sendCommand("$PMTK314,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0*29");
  mySerial.flush();
  delay(1000); 

  // matrix initialization
  rowsTracking = 1;
  trackingPrevious = new float*[rowsTracking];
  trackingPrevious[rowsTracking - 1] = new float[4];
  trackingPrevious[rowsTracking - 1][0] = 0.0;
  trackingPrevious[rowsTracking - 1][1] = 0.0;
  trackingPrevious[rowsTracking - 1][2] = 0.0;
  trackingPrevious[rowsTracking - 1][3] = 0.0;  
}

void loop() {
  GPS.read();
  if (GPS.newNMEAreceived()){
    GPS.parse(GPS.lastNMEA());    
    string nmea = (string) GPS.lastNMEA();
    nmea = split_string(nmea, '\n')[0];  // remove \n in end of string
    
    if(nmea.find("GSV") != std::string::npos){
      // Serial.println(nmea.c_str());
      // remove identification of sentence, total number of messages, message number, total of SV in view and verification digit (*...)
      nmea = nmea.substr(14, nmea.size());
      if(nmea.find("*") != std::string::npos){
        nmea = split_string(nmea, '*')[0];
      }
      if(nmea.find("$") != std::string::npos){
        nmea = split_string(nmea, '$')[0];
      }
      vector<string> GSVList = split_string(nmea, ',');

      int n = 0;
      float **GSV;
      if (GSVList.size() > 3) {
        GSV = new float*[(int) (GSVList.size() / 4)];
        for (int i = 0; i < (int) (GSVList.size() / 4); i++) {
          GSV[i] = new float[4];
          for (int j = 0; j < 4; j++) {
            GSV[i][j] = std::atof(GSVList[n].c_str());
            n = n + 1;
          }
        }  

        for (int i = 0; i < (int) (GSVList.size() / 4); i++) {
          if (GSV[i][1] >= 20) {  // elevation greater than 20º
          if (GSV[i][0] >= 37){

          }
            float prn_ = GSV[i][0];  
            float elevation_ = GSV[i][1];
            float azimute_ = GSV[i][2];
            float snr_ = GSV[i][3];
            float intensity_ = pow(10, (snr_ / 10.0));

            for(int j = 0; j < (rowsTracking - 1); j++) {
              delete[] tracking[j];   
            }
            delete[] tracking;

            tracking = new float*[rowsTracking];
            tracking[rowsTracking - 1] = new float[4];
            tracking[rowsTracking - 1][0] = prn_;
            Serial.println(nmea.c_str());
            Serial.println(tracking[rowsTracking - 1][0]);

            tracking[rowsTracking - 1][1] = intensity_;
            Serial.println(tracking[rowsTracking - 1][1]);

            tracking[rowsTracking - 1][2] = elevation_;
            Serial.println(tracking[rowsTracking - 1][2]);

            tracking[rowsTracking - 1][3] = azimute_;
            Serial.println(tracking[rowsTracking - 1][3]);


            Serial.println(" --- ");
            

            for (int j = 0; j < (rowsTracking - 1); j++) {
              tracking[j] = new float[4];
              tracking[j][0] = trackingPrevious[j][0];
              tracking[j][1] = trackingPrevious[j][1];
              tracking[j][2] = trackingPrevious[j][2];
              tracking[j][3] = trackingPrevious[j][3];
            }
            
            for(int j = 0; j < (rowsTracking - 1); j++) {
              delete[] trackingPrevious[j];   
            }
            delete[] trackingPrevious;

            trackingPrevious = new float*[rowsTracking];
            for (int j = 0; j < rowsTracking; j++){
              trackingPrevious[j] = new float[4];
              trackingPrevious[j][0] = tracking[j][0];
              trackingPrevious[j][1] = tracking[j][1];
              trackingPrevious[j][2] = tracking[j][2];
              trackingPrevious[j][3] = tracking[j][3];
            }
            rowsTracking = rowsTracking + 1;
          }
        }

        // for (int i = 0; i < (int) (GSVList.size() / 4); i++) {
        //   delete[] GSV[i];
        // }
        // delete[] GSV;
      }

      
    } 
    else if(nmea.find("RMC") != std::string::npos){
      // Serial.println(nmea.c_str());
      if (GPS.fix) {
        calculateCurrentLocation((double) GPS.latitude, (double) GPS.longitude);      
      }
      vector<string> RMCList = split_string(nmea, ',');
      if (RMCList.size() >= 2 && RMCList[1].find(".") != std::string::npos){
        rmcTime = RMCList[1];
        // Serial.println(rmcTime.c_str());
        if (RMCList.size() >= 9 && RMCList[9].find(".") == std::string::npos){
          rmcDate = RMCList[9];
          // Serial.println(rmcDate.c_str());
        }
      }
    }
    
    // if(nmea.find("GGA") != std::string::npos){
      // vector<string> result = split_string(nmea, ',');
      // for (size_t i = 0; i < result.size(); i++) {
      //    Serial.println(result[i].c_str());
      // }
    // }
    
    

    if (!GPS.parse(GPS.lastNMEA())){
      return;
    }
  }
}
