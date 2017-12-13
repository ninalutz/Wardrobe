boolean testVideo, testOpenCV, showFrameRate, showLeap;

//Sending alarm signal 

void setup(){
    size(640, 480);
    initServer();
    initVideo();
    initLeap();
    toSend = "Alarm,6.S063 Presentation,Weather,ButtonDown";
    sendtoDemo();
}


void draw(){
  background(255);
    sendtoDemo();
    drawLeap();
    if(testVideo){
        testVideoFunc();
    } 
    
    if(testOpenCV){
        testOpenCVFunc();
    } 
    
    if(showFrameRate){
        fill(255, 0, 0);
        text(frameRate, 50, 50);
    }
      
 
}