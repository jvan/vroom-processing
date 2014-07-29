import vroom.datastream.*;

DataStream stream = new DataStream();

void setup() {
  size(400, 400);
  stream.printHostname();
  try {
     stream.sendMessage("hello", "Hello from processing");
  } catch (Exception e) {
    e.printStackTrace(); 
  }
  println("message sent");
}

void draw() {
  background(50);
}
