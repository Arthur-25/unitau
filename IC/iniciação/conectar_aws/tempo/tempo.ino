#include <WiFi.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <time.h>

// Substitua pelas credenciais da sua rede Wi-Fi
const char* ssid = "VIVOFIBRA-0191";
const char* password = "aooiJuEYJz";

// Inicializa o cliente UDP para NTP
WiFiUDP ntpUDP;

// Define o fuso horário e o servidor NTP (ajuste o fuso horário conforme necessário)
NTPClient timeClient(ntpUDP, "pool.ntp.org", -3);  // "0" é UTC, ajuste conforme seu fuso horário

// Variável para armazenar data e hora
String dateTime;

void setup() {
  Serial.begin(115200);

  // Conecta-se à rede Wi-Fi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Conectando-se ao WiFi...");
  }
  Serial.println("Conectado ao WiFi!");

  // Inicia o cliente NTP
  timeClient.begin();

  // Configura o horário local (ajustar para o fuso horário local)
  configTime(-3 * 3600, 0, "pool.ntp.org");  // UTC-3 (Brasil)
}

void loop() {
  
  
  // Armazena a data e hora na variável
  dateTime = getDateTime();
  
  // Exibe a data e hora
  Serial.println(dateTime);
  
  delay(1000);  // Espera 1 segundo antes de atualizar novamente
}

// Função para obter data e hora formatada
String getDateTime() {

  // Atualiza a hora do NTP
  timeClient.update();
  // Obtém o tempo em segundos desde a época Unix
  unsigned long epochTime = timeClient.getEpochTime();
  
  // Converte o tempo Unix em uma estrutura tm (data e hora)
  struct tm *ptm = localtime((time_t*)&epochTime);  // Usando localtime para ajustar o fuso horário
  
  // Obtém o ano, mês, dia, hora, minuto e segundo
  int year = ptm->tm_year + 1900;  // O ano começa em 1900, então somamos 1900
  int month = ptm->tm_mon + 1;     // Mês começa em 0, então somamos 1
  int day = ptm->tm_mday;          // Dia do mês
  int hours = ptm->tm_hour;        // Hora
  int minutes = ptm->tm_min;       // Minuto
  int seconds = ptm->tm_sec;       // Segundo
  
  // Formata a data e hora como string
  String date = String(day) + "/" + String(month) + "/" + String(year);
  String time = String(hours) + ":" + String(minutes) + ":" + String(seconds);
  
  // Retorna a data e hora concatenadas
  return  date + " " + time;
}
