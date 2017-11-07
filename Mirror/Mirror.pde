void setup() {
  size(400, 600, P3D);
  background(255);
  initVideo();
  TextToSpeech.say("Hello I am Prepped", voiceSpeed);
  //initLeap();
}

void draw(){
  //background(255);
  //drawVideo();
  //drawLeap();
  drawOpenCV();
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
}


