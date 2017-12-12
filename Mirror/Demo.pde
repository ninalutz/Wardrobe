String[] data;

void init(){
    receiveData();
    
    data = split(input, ',');  // Split values into an array
    
    println(input, data);
    
    if(data !=null){
    if(data[0].equals("Alarm")){
      initAlarm();
    }
    }
}