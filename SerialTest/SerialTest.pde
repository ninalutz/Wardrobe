import processing.serial.*;

Serial myPort;  // Create object from Serial class

void setup() 
{
  size(200,200); //make our canvas 200 x 200 pixels big
  String portName = Serial.list()[9]; //change the 0 to a 1 or 2 etc. to match your port
  printArray(Serial.list());
  myPort = new Serial(this, portName, 115200);
}

void draw() {

}
void keyPressed(){
myPort.write('1');
println("HELO");
  }
