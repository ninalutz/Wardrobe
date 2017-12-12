import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;
Rectangle[] faces;

void initVideo(){
  cam = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  faces = opencv.detect();
  cam.start();

}

void drawOpenCV(){
  image(cam, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  opencv.loadImage(cam);
  faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
       rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}


void captureEvent(Capture c) {
  c.read();
}