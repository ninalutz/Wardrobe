import http.requests.*;

void setup() {
  size(displayWidth, displayHeight, P3D);
  String calLink = "https://www.googleapis.com/calendar/v3/calendars/oelag9qgq0ncqc5biihr562fgc@group.calendar.google.com";
  requestProcess(calLink);
 // initVideo();
  initLeap();
  initMirror();
  showLeap = true;
  //String portName = Serial.list()[9]; //change the 0 to a 1 or 2 etc. to match your port
  //println(portName);
  //myPort = new Serial(this, portName, 57600);
}

void draw(){
   background(100);
//  if(showVideo){
//    drawOpenCV();
//  }
  if(showLeap){
  drawLeap();
  }
  if(showAlarm){
    drawAlarm();
  }
  if(!showAlarm){
    drawHomeScreen();
    myPort.write('1');
  }
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  
}