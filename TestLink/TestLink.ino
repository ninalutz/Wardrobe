 void setup() {
 // initialize digital pin GPIO2/D9 as an output.
 pinMode(BUILTIN_LED, OUTPUT);
 }
 // the loop function runs over and over again forever
 void loop() {
 digitalWrite(BUILTIN_LED, HIGH);   // turn the LED on (HIGH is the voltage level)
 delay(2000);              // wait for a second
 digitalWrite(BUILTIN_LED, LOW);    // turn the LED off by making the voltage LOW
 delay(100);              // wait for a second
 }

