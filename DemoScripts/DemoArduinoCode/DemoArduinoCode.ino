#include <Servo.h> 
char val;
int count = 0;
Servo myservo;

#include <FastLED.h>
#define LED_PIN     5
#define NUM_LEDS    25
#define BRIGHTNESS  64
#define LED_TYPE    WS2811
#define COLOR_ORDER GRB
CRGB leds[NUM_LEDS];
#define UPDATES_PER_SECOND 100
CRGBPalette16 currentPalette;
TBlendType    currentBlending;
boolean drawerTrigger = false;


void setup() 
{ 
//  val = '1';
  Serial.begin(57600); // Start serial communication at 9600 bps
  Serial.println("STARTED");
  pinMode(LED_BUILTIN, OUTPUT);
  FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  FastLED.setBrightness(  BRIGHTNESS );
  currentPalette = RainbowColors_p;
  currentBlending = LINEARBLEND;
  myservo.attach(9);
} 

void loop() {
    val = Serial.read();
   // val = '1';
    static uint8_t startIndex = 0;
    startIndex = startIndex + 1; /* motion speed */
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);                       // wait for a second

    if(val == '1' && count < 1){
          delay(6000);
          myservo.write(160);  // set servo to mid-point
          FillLEDsFromPaletteColors( startIndex);
          FastLED.show();
          FastLED.delay(1000 / UPDATES_PER_SECOND);
          count+=1;
          delay(4700);
          myservo.write(92);
      }
      
  }

   
void FillLEDsFromPaletteColors( uint8_t colorIndex)
{
    uint8_t brightness = 255;
    for(int i =15; i<NUM_LEDS; i++){
        leds[i] = ColorFromPalette( currentPalette, colorIndex, brightness, currentBlending);
        colorIndex += 3;
      }
    
//    for( int i = 0; i < NUM_LEDS; i++) {
//        leds[i] = ColorFromPalette( currentPalette, colorIndex, brightness, currentBlending);
//        colorIndex += 3;
//    }
}

