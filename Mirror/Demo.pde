String[] data;

void init(){
    input = input.substring(0,input.indexOf(","));  // Only up to the newline
    data = split(input, ' ');  // Split values into an array
    
    println(input, data);
    
    if(data[0].equals("Alarm")){
      initAlarm();
    }
}