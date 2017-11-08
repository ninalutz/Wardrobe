boolean showAlarm;
WaveViz alarmWaves;

void initMirror(){
   // TextToSpeech.say("GOOD MORNING! It's time to wake up!", voiceSpeed);
    showAlarm = true;
    alarmWaves = new WaveViz();
}


void drawAlarm(){
    alarmWaves.draw();
  }
  


class WaveViz{
  
  WaveViz(){}
  
  int num =51;
  float sz, offSet, theta, angle;
  float step = 22;

  void draw() {
    strokeWeight(5);
    pushMatrix();
    translate(width/2, height/3);
    angle=0;
    for (int i=0; i<num; i++) {
      stroke(255);
      noFill();
      sz = i*step;
      float offSet = TWO_PI/num*i;
      float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
      arc(0, 0, sz, sz, PI, arcEnd);
    }
    colorMode(RGB);
    resetMatrix();
    popMatrix();
    theta += .0523;
    strokeWeight(1);
  }
}
