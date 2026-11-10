#include <TinyGPS++.h>
#include <HardwareSerial.h>

TinyGPSPlus gps;
HardwareSerial gpsSerial(2);

#define GPS_RX_PIN 16
#define GPS_TX_PIN 17
#define GPS_BAUD_RATE 9600

void setup() {
    Serial.begin(115200);
    gpsSerial.begin(GPS_BAUD_RATE, SERIAL_8N1, GPS_RX_PIN, GPS_TX_PIN);
}

void loop() {
    while (gpsSerial.available() > 0) {
        gps.encode(gpsSerial.read());
    }
    
    if (gps.satellites.isValid()) {
        int satelites = gps.satellites.value();
        Serial.print("Satélites detectados: ");
        Serial.println(satelites);
        
        float matriz[satelites][2];
        for (int i = 0; i < satelites; i++) {
            matriz[i][0] = gps.altitude.isValid() ? gps.altitude.meters() : 0.0;
            matriz[i][1] = gps.course.isValid() ? gps.course.deg() : 0.0;
        }
        
        Serial.println("+------------+------------+");
        Serial.println("| Altitude   | Azimuth    |");
        Serial.println("+------------+------------+");
        for (int i = 0; i < satelites; i++) {
            Serial.print("| ");
            Serial.print(matriz[i][0], 2);
            Serial.print("       | ");
            Serial.print(matriz[i][1], 2);
            Serial.println("      |");
        }
        Serial.println("+------------+------------+");
    }
    
    delay(10000);
}
