void setup() {
  size(displayWidth, displayHeight, P3D);
  background(255);
  initLeap();
  initVideo();
}

void draw(){
  background(255);
  rotate(-PI/2);
  drawVideo();
  drawLeap();
  rotate(PI/2);
}


