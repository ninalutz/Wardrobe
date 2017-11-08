#include <FastLED.h>
#define LED_PIN     6
#define NUM_LEDS    100
#define BRIGHTNESS  64
#define LED_TYPE    WS2811
#define COLOR_ORDER GRB
CRGB leds[NUM_LEDS];
#define UPDATES_PER_SECOND 100
CRGBPalette16 currentPalette;
TBlendType    currentBlending;
char val; // Data received from the serial port
boolean doLights = false;

void setup() {
    delay( 3000 ); // power-up safety delay
    FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
    FastLED.setBrightness(  BRIGHTNESS );
    currentPalette = RainbowColors_p;
    currentBlending = LINEARBLEND;
    Serial.begin(57600); // Start serial communication at 9600 bps
    Serial.println("STARTED");
}


void loop()
{   val = Serial.read();
    Serial.println(val);  
    static uint8_t startIndex = 0;
    startIndex = startIndex + 1; /* motion speed */

    if(doLights){
    FillLEDsFromPaletteColors( startIndex);
    FastLED.show();
    FastLED.delay(1000 / UPDATES_PER_SECOND);
    }

   if (val == '1') {
      doLights = true;
   }
   delay(10);

}

void FillLEDsFromPaletteColors( uint8_t colorIndex)
{
    uint8_t brightness = 255;
    
    for( int i = 0; i < NUM_LEDS; i++) {
        leds[i] = ColorFromPalette( currentPalette, colorIndex, brightness, currentBlending);
        colorIndex += 3;
    }
}

