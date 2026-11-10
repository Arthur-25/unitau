#include <HardwareSerial.h>
#include <string>
#include <vector>
#include <cstdlib> // Inclua para strtol

using namespace std;

HardwareSerial GPS_Serial(1);

vector<string> split_string(const string& str, const char& delimiter) {
  vector<string> tokens;
  string token;
  for (char c : str) {
    if (c == delimiter) {
      if (!token.empty()) {
        tokens.push_back(token);
        token.clear();
      }
    } else {
      token += c;
    }
  }
  if (!token.empty()) tokens.push_back(token);
  return tokens;
}

void sendCommand(const char* cmd) {
  GPS_Serial.println(cmd);
  delay(100);
}

void setupGPS() {
  GPS_Serial.begin(9600, SERIAL_8N1, 16, 17); // pinos RX=16, TX=17 (ajustar se usar outros)

  delay(500); // Adicionado atraso antes do primeiro comando

  sendCommand("$PMTK314,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0*29"); // Habilita GGA + GSV + RMC
  sendCommand("$PMTK220,100*2F"); // Define taxa de atualização em 10Hz (100ms)
}

void processGSV(const string& nmea) {
  vector<string> fields = split_string(nmea, ',');

  if (fields.size() < 4) {
    Serial.println("Mensagem GSV incompleta!");
    return;
  }

  int totalMessages = stoi(fields[1]);
  int messageNumber = stoi(fields[2]);
  int satellitesInView = stoi(fields[3]);

  Serial.printf("Mensagem %d/%d - Satélites visíveis: %d\n", messageNumber, totalMessages, satellitesInView);

  int baseIdx = 4;

  while (baseIdx + 3 < fields.size()) {
    if (baseIdx >= fields.size() || fields[baseIdx].empty()) break;
    if (baseIdx + 1 >= fields.size() || fields[baseIdx + 1].empty()) break;
    if (baseIdx + 2 >= fields.size() || fields[baseIdx + 2].empty()) break;
    if (baseIdx + 3 >= fields.size()) break; // SNR pode estar vazio

    int prn = stoi(fields[baseIdx]);
    int elevation = stoi(fields[baseIdx + 1]);
    int azimuth = stoi(fields[baseIdx + 2]);

    long snrLong = strtol(fields[baseIdx + 3].c_str(), nullptr, 10);
    if (errno == 0) {
      if (snrLong >= 0 && snrLong <= 100) { // Adicionada verificação de intervalo razoável
        int snr = static_cast<int>(snrLong);
        Serial.printf("Satélite PRN: %d | Elevação: %d° | Azimute: %d° | SNR: %d\n", prn, elevation, azimuth, snr);
      } else if (!fields[baseIdx + 3].empty()) {
        Serial.printf("SNR fora do intervalo: '%s'\n", fields[baseIdx + 3].c_str());
      } else {
        Serial.printf("Satélite PRN: %d | Elevação: %d° | Azimute: %d° | SNR: 0 (vazio)\n", prn, elevation, azimuth);
      }
    } else if (!fields[baseIdx + 3].empty()) {
      Serial.printf("Erro ao converter SNR: '%s'\n", fields[baseIdx + 3].c_str());
    } else {
      Serial.printf("Satélite PRN: %d | Elevação: %d° | Azimute: %d° | SNR: 0 (vazio)\n", prn, elevation, azimuth);
    }
    errno = 0; // Reset errno

    baseIdx += 4;
  }
}

void readGPS() {
  static string buffer;

  while (GPS_Serial.available()) {
    char c = GPS_Serial.read();
    if (c == '\n') {
      if (buffer.find("$GPGSV") != string::npos || buffer.find("$GLGSV") != string::npos) {
        Serial.print("Processando (GPS): ");
        Serial.println(buffer.c_str());
        processGSV(buffer);
      }
      buffer.clear();
    } else if (c != '\r') {
      buffer += c;
    }
  }
}

void setup() {
  Serial.begin(115200);
  delay(3000);
  Serial.println("Iniciando GPS...");
  delay(500); // Adicionado atraso antes de inicializar a serial do GPS
  setupGPS();
}

void loop() {
  readGPS();
}