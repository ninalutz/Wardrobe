import processing.video.*; 
Capture cam; 

void initVideo(){
  cam = new Capture(this, width, height);
  cam.start(); 
}

void drawVideo(){
    if (cam.available()) { 
    // Reads the new frame
    cam.read(); 
  } 
  image(cam, 0, 0); 
}
