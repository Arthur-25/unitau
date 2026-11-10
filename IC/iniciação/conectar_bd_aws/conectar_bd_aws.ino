#include "secrets.h"
#include "tempo.h"
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include "WiFi.h"

#include "DHT.h"
#define DHTPIN 14     // Digital pin connected to the DHT sensor
#define DHTTYPE DHT22   // DHT 22


#define AWS_IOT_PUBLISH_TOPIC   "esp32/pub"
#define AWS_IOT_SUBSCRIBE_TOPIC "esp32/sub"

float h ;
float t;
String isoDateTime;

DHT dht(DHTPIN, DHTTYPE);

WiFiClientSecure net = WiFiClientSecure();
PubSubClient client(net);

String convertToISO8601(String dateTime) {
    // Separar a data e a hora
    int spaceIndex = dateTime.indexOf(' ');
    String datePart = dateTime.substring(0, spaceIndex);  // "10/02/2025"
    String timePart = dateTime.substring(spaceIndex + 1); // "13:45:30"

    // Reorganizar a data para o formato ISO 8601
    int firstSlash = datePart.indexOf('/');
    int secondSlash = datePart.lastIndexOf('/');

    String day = datePart.substring(0, firstSlash);      // "10"
    String month = datePart.substring(firstSlash + 1, secondSlash); // "02"
    String year = datePart.substring(secondSlash + 1);   // "2025"

    // Garantir que dia e mês tenham 2 dígitos
    if (day.length() == 1) day = "0" + day;
    if (month.length() == 1) month = "0" + month;

    // Combinar no formato ISO 8601
    String isoDateTime = year + "-" + month + "-" + day + "T" + timePart;

    return isoDateTime;
}

void connectAWS()
{
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  Serial.println("Connecting to Wi-Fi");

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }

  // Configure WiFiClientSecure to use the AWS IoT device credentials
  net.setCACert(AWS_CERT_CA);
  net.setCertificate(AWS_CERT_CRT);
  net.setPrivateKey(AWS_CERT_PRIVATE);

  // Connect to the MQTT broker on the AWS endpoint we defined earlier
  client.setServer(AWS_IOT_ENDPOINT, 8883);

  // Create a message handler
  client.setCallback(messageHandler);

  Serial.println("Connecting to AWS IOT");

  while (!client.connect(THINGNAME))
  {
    Serial.print(".");
    delay(100);
  }

  if (!client.connected())
  {
    Serial.println("AWS IoT Timeout!");
    return;
  }

  // Subscribe to a topic
  client.subscribe(AWS_IOT_SUBSCRIBE_TOPIC);

  Serial.println("AWS IoT Connected!");
}

void publishMessage()
{
  StaticJsonDocument<200> doc;
  doc["DeviceId"] = 1;
  doc["Humidity"] = h;
  doc["Temperature"] = t;
  doc["timestamp"] = isoDateTime;
  char jsonBuffer[512];
  serializeJson(doc, jsonBuffer); // print to client

  client.publish(AWS_IOT_PUBLISH_TOPIC, jsonBuffer);
}

void messageHandler(char* topic, byte* payload, unsigned int length)
{
  Serial.print("incoming: ");
  Serial.println(topic);

  StaticJsonDocument<200> doc;
  deserializeJson(doc, payload);
  const char* message = doc["message"];
  Serial.println(message);
}

void setup()
{
  Serial.begin(115200);

  connectAWS();
  dht.begin();

// Inicializa o NTP e configura o horário local
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);

  // Aguarda a primeira sincronização NTP
  Serial.println("Aguardando sincronização NTP...");
  delay(2000); // Aguardar tempo suficiente para sincronização
}

void loop()
{

  if (Serial.available()) {
        String comando = Serial.readStringUntil('\n');
        if (comando == "deep_sleep") {
            Serial.println("Entrando em Deep Sleep...");
            esp_deep_sleep_start();
        }
  }
  
  h = dht.readHumidity();
  t = dht.readTemperature();
  

  // Armazena a data e hora na variável
  String dateTime = getDateTime();
   isoDateTime = convertToISO8601(dateTime);
  Serial.println(isoDateTime); // Saída esperada: "2025-02-10T13:45:30"

  if (isnan(h) || isnan(t))  // Check if any reads failed and exit early (to try again).
  {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }

  Serial.print(F("Humidity: "));
  Serial.print(h);
  Serial.print(F("%  Temperature: "));
  Serial.print(t);
  Serial.println(F("°C "));
  Serial.print(F(" timestamp: "));
  Serial.println(dateTime);

  publishMessage();
  client.loop();
  
  delay(10000);
}


