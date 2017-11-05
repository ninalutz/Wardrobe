void setup() {
  size(displayWidth, displayHeight, P3D);
  background(255);
  initLeap();
  initVideo();
}

void draw(){
  background(255);
  drawVideo();
  drawLeap();
}


