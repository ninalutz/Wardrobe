boolean showAlarm, showHome;
WaveViz alarmWaves;
homeAnimation homeAn;
import ddf.minim.*;

AudioPlayer player;
Minim minim; //audio context

void initFace(){
    alarmWaves = new WaveViz();
    homeAn = new homeAnimation();
    minim = new Minim(this);
    player = minim.loadFile("demo.mp3", 2048);
}

void initAlarm(){
    TextToSpeech.say("GOOD MORNING! It's time to wake up!", voiceSpeed);
    initDoor();
    delay(2000);
    showAlarm = true;
}

void stop(){
   // player.close();
   // minim.stop();
}

void drawAlarm(){
    colorMode(HSB);
    if (cWave >= 255)  cWave=0;  else  cWave++;
      background(cWave, 255, 255);
      
    alarmWaves.draw();
    player.play();
    
    fill(0,0,0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Swipe any way \n to stop alarm", width/2, height/2);
  }


void drawHomeScreen(){
  textSize(100);
  String time = hour() + ":" + minute() + ":" + second();
  text(time, width/2, height/8);
  homeAn.draw();
}