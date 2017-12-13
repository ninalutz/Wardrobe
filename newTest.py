# Simple demo of of the WS2801/SPI-like addressable RGB LED lights.
import time
import RPi.GPIO as GPIO

# Import the WS2801 module.
import Adafruit_WS2801
import Adafruit_GPIO.SPI as SPI


# Configure the count of pixels:
PIXEL_COUNT = 20

# Alternatively specify a hardware SPI connection on /dev/spidev0.0:
SPI_PORT   = 0
SPI_DEVICE = 0
pixels = Adafruit_WS2801.WS2801Pixels(PIXEL_COUNT, spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE), gpio=GPIO)

def wheel(pos):
	return Adafruit_WS2801.RGB_to_color(255, 255, 255)

# Define rainbow cycle function to do a cycle of all hues.
def rainbow_cycle_successive(pixels):
    for i in range(pixels.count()):
    	pixels.set_pixel(i, wheel(((i * 256 // pixels.count())) % 256) )
    	pixels.show()

if __name__ == "__main__":
    # Clear all the pixels to turn them off.
    print("HELLO")
    pixels.clear()

    rainbow_cycle_successive(pixels)

    pixels.show()  # Make sure to call show() after changing any pixels!

    print("GOODBYE")
