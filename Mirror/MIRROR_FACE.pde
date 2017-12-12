boolean showAlarm;
WaveViz alarmWaves;
homeAnimation homeAn;
import ddf.minim.*;

AudioPlayer player;
Minim minim; //audio context

void initAlarm(){
    TextToSpeech.say("GOOD MORNING! It's time to wake up!", voiceSpeed);
    delay(2000);
    showAlarm = true;
    alarmWaves = new WaveViz();
    homeAn = new homeAnimation();
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
int cWave;

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

void drawHomeScreen(){
  textSize(100);
  String time = hour() + ":" + minute() + ":" + second();
  text(time, width/2, height/8);
  homeAn.draw();
}


class homeAnimation{
    int nbCircles = 8;
    Circle[] circles;
    MyColor myColor;
    float rMax, dMin;
    
      homeAnimation(){
          rMax = min(width, height)/2;
          dMin = max(width, height)/3.5;
          circles = new Circle[nbCircles];
          initialize(false);
      }
    
    void initialize(Boolean p_random)
    { 
      for (int i = 0; i < nbCircles; i++)
      {
        circles[i] = new Circle(random(rMax), 
        p_random ? random(-width/3, width/3) : 0, 
        p_random ? random(-height/3, height/3) : 0);
      }
      myColor = new MyColor();
    }
    
    void draw()
    {
      noStroke();
    
      translate(width/2, height/2);
      myColor.update();
      for (int j = 0; j < nbCircles; j++)
      {
        circles[j].update();
        for (int i = j+1; i < nbCircles; i++)
        {
          connect(circles[j], circles[i]);
        }
      }
    }
    
    void connect(Circle c1, Circle c2)
    {
      float d, x1, y1, x2, y2, r1 = c1.radius, r2 = c2.radius;
      float rCoeff = map(min(abs(r1), abs(r2)), 0, rMax, .08, 1);
      int n1 = c1.nbLines, n2 = c2.nbLines;
      for (int i = 0; i < n1; i++)
      {
        x1 = c1.x + r1 * cos(i * TWO_PI / n1 + c1.theta);
        y1 = c1.y + r1 * sin(i * TWO_PI / n1 + c1.theta);
        for (int j = 0; j < n2; j++)
        {
          x2 = c2.x + r2 * cos(j * TWO_PI / n2 + c2.theta);
          y2 = c2.y + r2 * sin(j * TWO_PI / n2 + c2.theta);
    
          d = dist(x1, y1, x2, y2);
          if (d < dMin)
          {
            stroke(myColor.R + r2/1.5, myColor.G + r2/2.2, myColor.B + r2/1.5, map(d, 0, dMin, 140, 0) * rCoeff);
            line(x1, y1, x2, y2);
          }
        }
      }
    }
    
    void mousePressed()
    {
      initialize(mouseButton == RIGHT);
    }
    
    class Circle
    {
      float x, y, radius, theta = 0;
      int nbLines = (int)random(3, 25);
      float rotSpeed = (random(1) < .5 ? 1 : -1) * random(.005, .034);
      float radSpeed = (random(1) < .5 ? 1 : -1) * random(.3, 1.4);
      
      Circle(float p_radius, float p_x, float p_y)
      {
        radius = p_radius;
        x = p_x;
        y = p_y;
      }
    
      void update()
      {
        theta += rotSpeed;
        radSpeed *= abs(radius += radSpeed) > rMax ? -1 : 1;
      }
    }
    
    class MyColor
    {
      float R, G, B, Rspeed, Gspeed, Bspeed;
      final static float minSpeed = .2;
      final static float maxSpeed = .8;
      MyColor()
      {
        R = random(20, 255);
        G = random(20, 255);
        B = random(20, 255);
        Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
        Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
        Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
      }
    
      public void update()
      {
        Rspeed = ((R += Rspeed) > 255 || (R < 20)) ? -Rspeed : Rspeed;
        Gspeed = ((G += Gspeed) > 255 || (G < 20)) ? -Gspeed : Gspeed;
        Bspeed = ((B += Bspeed) > 255 || (B < 20)) ? -Bspeed : Bspeed;
      }
    }
    }