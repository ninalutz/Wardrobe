import processing.net.*; 

Client backend, lights;
Server s;
String input;
String[] data;

void initConnection(){
  backend = new Client(this, "18.111.78.34", 12345);
}

String alarmInfo;
String[] alarmArray;

void readData(){
  if (backend.available() > 0) { 
    input = backend.readString(); 
    data = split(input, ',');  // Split values into an array
    println("Received: ", input);
  }
  
  //initialize alarm sequence
  if(data != null && data[0].equals("Alarm") && !initialized){
    initAlarm();
    initialized = true;
    alarmInfo = input;
    alarmArray = data;
    println("initialized");
  }
  
  //turn off alarm at swipe
  if(data != null && data[0].equals("swipe") && !alarmClosed){
    showAlarm = false;
    showHome = true;
    player.close();
    minim.stop();
    
    //Say the proper thing from original data stream
     TextToSpeech.say("Good morning Bryan! The first thing on your calendar is " + alarmArray[1]
     + " and it's currently " + alarmArray[2] + "may I recommend you wear your " + alarmArray[3], voiceSpeed);
 
    //Do the door 
    moveDoor(alarmArray[4]);
    
    //Do the lights
    cueLights(alarmArray[4]);
    
    alarmClosed = true;
  }
  

}