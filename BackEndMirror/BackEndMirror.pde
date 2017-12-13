boolean testVideo, testOpenCV, showFrameRate, showLeap;

//Sending alarm signal 

void setup(){
    size(640, 480);
    initServer();
    initVideo();
    initLeap();
    toSend = "Alarm,6.S063 Presentation at 1pm,clear and 24 degrees,Button Down,location";
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