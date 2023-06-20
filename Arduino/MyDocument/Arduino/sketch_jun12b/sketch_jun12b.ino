/*
  Rui Santos
  Complete project details at Complete project details at https://RandomNerdTutorials.com/esp32-http-get-post-arduino/

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
*/

#include <WiFi.h>
#include <HTTPClient.h>

#include "DHTesp.h" // Click here to get the library: http://librarymanager/All#DHTesp
#include <Ticker.h>


///////////////////////////////////////////////////////
//  For DHT sensor
///////////////////////////////////////////////////////
#define USE_SENSOR_DHT11    0
#define USE_SENSOR_DHT22    1


#define SENSOR_ID USE_SENSOR_DHT11 //온습도 센서 

#define DHT_PIN   23

#define GET_SENSOR_VALUE_PERIOD  10 // unit: second , 속도 조절 

#if (SENSOR_ID == 0)
#define DHT_TYPE  DHTesp::DHT11
#else
#define DHT_TYPE  DHTesp::DHT22
#endif

DHTesp dht;
void dhtSensorTask(void *pvParameters);
bool getSensorValues();
void triggerGetSensorValue();
/** Task handle for the light value read task */
TaskHandle_t dhtSensorTaskHandle = NULL;
/** Ticker for Sensor reading */
Ticker dhtSensorTicker;
TempAndHumidity sensorValues;
bool init_DHT_Sensor() {
  byte resultValue = 0;
  // Initialize temperature sensor
	dht.setup(DHT_PIN, DHT_TYPE);
	Serial.println("DHT sensor initiated");

  // Start task to get temperature
	xTaskCreatePinnedToCore(
			dhtSensorTask,                  /* Function to implement the task */
			"dhtSensorTask ",               /* Name of the task */
			4000,                           /* Stack size in words */
			NULL,                           /* Task input parameter */
			5,                              /* Priority of the task */
			&dhtSensorTaskHandle,           /* Task handle. */
			1);                             /* Core where the task should run */

  if (dhtSensorTaskHandle == NULL) {
    Serial.println("Failed to start task for temperature update");
    return false;
  } else {
    // Start update of environment data every [GET_SENSOR_VALUE_PERIOD] seconds
    dhtSensorTicker.attach(GET_SENSOR_VALUE_PERIOD, triggerGetSensorValue);
  }
  return true;
}

/**
 * triggerGetSensorValue
 * Sets flag dhtUpdated to true for handling in loop()
 * called by Ticker getTempTimer
 */
void triggerGetSensorValue() {
  if (dhtSensorTaskHandle != NULL) {
	   xTaskResumeFromISR(dhtSensorTaskHandle);
  }
}

/**
 * Task to reads temperature/humidity from DHT sensor
 * @param pvParameters
 *    pointer to task parameters
 */
void dhtSensorTask(void *pvParameters) {
	Serial.println("dhtSensorTask loop started");
	while (1) // tempTask loop
  {
    getSensorValues();
    // Got sleep again
		vTaskSuspend(NULL);
	}
}

/**
 * getSensorValues
 * Reads temperature from DHT11 sensor
 * @return bool
 *    true if temperature could be aquired
 *    false if aquisition failed
*/
bool getSensorValues() {
	// Reading temperature for humidity takes about 250 milliseconds!
	// Sensor readings may also be up to 2 seconds 'old' (it's a very slow sensor)
  sensorValues = dht.getTempAndHumidity();
	// Check if any reads failed and exit early (to try again).
	if (dht.getStatus() != 0) {
		Serial.println("DHT sensor error status: " + String(dht.getStatusString()));
		return false;
	}

  Serial.println("Temperature:" + String(sensorValues.temperature) + ", Humidity:" + String(sensorValues.humidity));
	return true;
}



///////////////////////////////////////////////////////
//  For Wifi
///////////////////////////////////////////////////////

const char* ssid = "Ezen_7632";
const char* password = "a123456789"; //학원 무선 AP 

//Your Domain name with URL path or IP address with path
const char* serverName = "http://192.168.0.76:8080/sensor/getData";  //스프링 서버
const char* serverName2 = "http://192.168.0.50:8080/sensor/getData";  //스프링 서버

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 5000;

char sendBuffer[200];

void setup() {
  Serial.begin(115200);
  Serial.println();
  WiFi.begin(ssid, password); //AP 의  ssid와 비밀번호
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED) { //wifi가 연결되지 않으면 console 창에 ....... 출력됨 
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
  init_DHT_Sensor(); //온습도 센서 초기화 
}
 

void loop() {
  //Send an HTTP POST request every 10 minutes(매 10분마다 POST 요청 전송 )
  if ((millis() - lastTime) > timerDelay) {
    //Check WiFi connection status
    if(WiFi.status()== WL_CONNECTED){
      WiFiClient client;// WIFI 객체 생성
      HTTPClient http; //HTTP 객체 생성 
      WiFiClient client2;// WIFI 객체 생성
      HTTPClient http2; //HTTP 객체 생성 
    
      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName);// 
      http2.begin(client2, serverName2);
      // If you need Node-RED/server authentication, insert user and password below
      //http.setAuthorization("REPLACE_WITH_SERVER_USERNAME", "REPLACE_WITH_SERVER_PASSWORD");
      
      // Specify content-type header
      //http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      // Data to send with HTTP POST
      //String httpRequestData = "api_key=tPmAT5Ab3j7F9&sensor=BME280&value1=24.25&value2=49.54&value3=1005.14";           
      // Send HTTP POST request
      //int httpResponseCode = http.POST(httpRequestData);
      
      // If you need an HTTP request with a content type: application/json, use the following:
     http.addHeader("Content-Type", "application/json");
     http2.addHeader("Content-Type", "application/json");
#if (SENSOR_ID == 0)
      sprintf(sendBuffer,"{\"api_key\":\"tPmAT5Ab3j7F9\",\"sensor\":\"DHT11\",\"temp\":\"%.2f\",\"humi\":\"%.2f\"}", sensorValues.temperature, sensorValues.humidity);
      sprintf(sendBuffer,"{\"api_key\":\"tPmAT5Ab3j7F9\",\"sensor\":\"DHT11\",\"temp\":\"%.2f\",\"humi\":\"%.2f\"}", sensorValues.temperature, sensorValues.humidity);
#elif (SENSOR_ID == 1)
      sprintf(sendBuffer,"{\"api_key\":\"tPmAT5Ab3j7F8\",\"sensor\":\"DHT22\",\"temp\":\"%.2f\",\"humi\":\"%.2f\"}", sensorValues.temperature, sensorValues.humidity);
#else //Unknown sensor
      Serial.print("Unknown sensor");
     // Free resources
      http.end();
      return;
#endif
    int httpResponseCode = http.POST(sendBuffer);
    int httpResponseCode2 = http2.POST(sendBuffer);
      Serial.print("Send to Web server : ");
      Serial.println(sendBuffer);
      // If you need an HTTP request with a content type: text/plain
      //http.addHeader("Content-Type", "text/plain");
      //int httpResponseCode = http.POST("Hello, World!");
     
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
        
      // Free resources
      http.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }

 yield();
}