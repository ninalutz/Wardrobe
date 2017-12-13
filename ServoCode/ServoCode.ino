#include <Servo.h> 
char val;
int count = 0;
Servo myservo;

void setup() 
{ 
 Serial.begin(57600); // Start serial communication at 9600 bps
  Serial.println("STARTED");
  pinMode(LED_BUILTIN, OUTPUT);
} 

void loop() {
    val = Serial.read();

    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);                       // wait for a second

    if(val == '1' && count < 5){
          myservo.attach(9);
          myservo.write(90);  // set servo to mid-point
//          digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
//          delay(1000);                       // wait for a second
//          digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
//          delay(1000);                       // wait for a second
         // count+=1;
      }
  } 
