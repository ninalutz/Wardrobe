import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

//Variables for video test
color black = color(0);
color white = color(255);
int numPixels;
int threshold = 127; // Set the threshold value
float pixelBrightness; // Declare variable to store a pixel's color

//variables for OpenCV test
PImage src, colorFilteredImage;
ArrayList<Contour> contours;
int rangeLow = 20;
int rangeHigh = 35;

//Objects
Capture video;
OpenCV opencv;

void initVideo(){
   // This the default video input, see the GettingStartedCapture 
  // example if it creates an error

  video = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  contours = new ArrayList<Contour>();
  
  // Start capturing the images from the camera
  video.start(); 
  
  numPixels = video.width * video.height;
  
}


void testVideoFunc(){ //simple test of raw video pixels 
    if (video.available()) {
        video.read();
        video.loadPixels();
        loadPixels();
        
        for (int i = 0; i < numPixels; i++) {
            pixelBrightness = brightness(video.pixels[i]);
            if (pixelBrightness > threshold) { // If the pixel is brighter than the
                pixels[i] = white; // threshold value, make it white
            } 
            else { // Otherwise,
                pixels[i] = black; // make it black
            }
        }
    updatePixels();
  }
}

void testOpenCVFunc(){
    // Read last captured frame
    if (video.available()) {
        video.read();
    }
  
    // <2> Load the new frame of our movie in to OpenCV
    opencv.loadImage(video);
    
    // Tell OpenCV to use color information
    opencv.useColor();
    src = opencv.getSnapshot();
    
    // <3> Tell OpenCV to work in HSV color space.
    opencv.useColor(HSB);
    
    // <4> Copy the Hue channel of our image into 
    //     the gray channel, which we process.
    opencv.setGray(opencv.getH().clone());
    
    // <5> Filter the image based on the range of 
    //     hue values that match the object we want to track.
    opencv.inRange(rangeLow, rangeHigh);
    
    // <6> Get the processed image for reference.
    colorFilteredImage = opencv.getSnapshot();

    // <7> Find contours in our range image.
    //     Passing 'true' sorts them by descending area.
    contours = opencv.findContours(true, true);
    
    // <8> Display background images
    image(src, 0, 0);
    image(colorFilteredImage, src.width, 0);
    
    // <9> Check to make sure we've found any contours
    if (contours.size() > 0) {
        // <9> Get the first contour, which will be the largest one
        Contour biggestContour = contours.get(0);
        
        // <10> Find the bounding box of the largest contour,
        //      and hence our object.
        Rectangle r = biggestContour.getBoundingBox();
        
        // <11> Draw the bounding box of our object
        noFill(); 
        strokeWeight(2); 
        stroke(255, 0, 0);
        rect(r.x, r.y, r.width, r.height);
        
        // <12> Draw a dot in the middle of the bounding box, on the object.
        noStroke(); 
        fill(255, 0, 0);
        ellipse(r.x + r.width/2, r.y + r.height/2, 30, 30);
    }
}