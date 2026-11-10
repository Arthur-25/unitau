#include "WiFi.h"
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <time.h>

// Define o fuso horário e o servidor NTP (ajuste o fuso horário conforme necessário)
const char* ntpServer = "pool.ntp.org";  // Servidor NTP
const long  gmtOffset_sec = -3 * 3600;   // Fuso horário UTC-3 (Brasil)
const int   daylightOffset_sec = 0;       // Ajuste para horário de verão (0 se não usar)

// Inicializa o cliente UDP para NTP
WiFiUDP ntpUDP;

// Define o fuso horário e o servidor NTP (ajuste o fuso horário conforme necessário)
NTPClient timeClient(ntpUDP, "pool.ntp.org", -3);  // "0" é UTC, ajuste conforme seu fuso horário

// Variável para armazenar data e hora
String dateTime;



  

String getDateTime() {

   struct tm timeinfo;
  
  // Verifica se o tempo foi obtido corretamente
  if (!getLocalTime(&timeinfo)) {
    Serial.println("Falha ao obter o horário NTP");
    return "Erro ao obter hora";
  }
  
  // Atualiza a hora do NTP
  timeClient.update();
  // Obtém o tempo em segundos desde a época Unix
  unsigned long epochTime = timeClient.getEpochTime();
  
  // Converte o tempo Unix em uma estrutura tm (data e hora)
  struct tm *ptm = localtime((time_t*)&epochTime);  // Usando localtime para ajustar o fuso horário
  
  // Obtém a data e a hora formatada
  int year = timeinfo.tm_year + 1900;  // O ano começa em 1900
  int month = timeinfo.tm_mon + 1;     // O mês começa em 0
  int day = timeinfo.tm_mday;          // O dia do mês
  int hours = timeinfo.tm_hour;        // A hora
  int minutes = timeinfo.tm_min;       // Os minutos
  int seconds = timeinfo.tm_sec;       // Os segundos
  
  // Formata a data e hora como string
  String date = String(day) + "/" + String(month) + "/" + String(year);
  String time = String(hours) + ":" + String(minutes) + ":" + String(seconds);
  
  // Retorna a data e hora concatenadas
  return  date + " " + time;
}