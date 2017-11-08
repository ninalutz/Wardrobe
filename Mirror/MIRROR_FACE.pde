boolean showAlarm;
WaveViz alarmWaves;

import ddf.minim.*;

AudioPlayer player;
Minim minim; //audio context

void initMirror(){
    TextToSpeech.say("GOOD MORNING! It's time to wake up!", voiceSpeed);
    delay(2000);
    showAlarm = true;
    alarmWaves = new WaveViz();
    
    minim = new Minim(this);
    player = minim.loadFile("iwanna.mp3", 2048);
}

void stop()
{
  player.close();
  minim.stop();
}

void yesNo(int state){
  if(state == 1){
    
  }
}
int c;
void drawAlarm(){
    colorMode(HSB);
    if (c >= 255)  c=0;  else  c++;
      background(c, 255, 255);
      
    alarmWaves.draw();
    player.play();
    
    fill(0,0,0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Swipe any way \n to stop alarm", width/2, height/2);
    
    
    
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
      stroke(255, 0, 0);
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
