// Vroom datastream example program.
// 
// This program creates an interface for interacting with a 
// vroom application (cube.vroom) using the datastream module.
// When the colored squares are clicked a message is sent with 
// the color value. If the vroom application is running the 
// color of the cube should change.

import vroom.datastream.*;

// Create a DataStream object for sending messages to the vroom
// application.
DataStream stream = new DataStream();

// Set the queue name for sending messages.
String queue = "vroom.control";

int screen_width, screen_height;

void setup() {
  // Initialize the application window.
  screen_width  = 250;
  screen_height = 650;
  size(screen_width, screen_height);
  background(80);
  
  // Connect to the message server.
  stream.setHostname("localhost", 5672);
  stream.printHostname();
}

void draw_square(int x, int y, int s) {
  rect(x, y, s, s);
}

void draw() {
  stroke(150);
  strokeWeight(5);

  int s = 150;
  int x_offset = int((screen_width - s)/2);
  int y_offset = int((screen_height - 3*s)/4);

  int x = x_offset;
  int y = y_offset;

  fill(255, 0, 0);
  draw_square(x, y, s);

  y += (s + y_offset);
  fill(0, 255, 0);
  draw_square(x, y, s);

  y += (s + y_offset);
  fill(0, 0, 255);
  
  draw_square(x, y, s);
}
  
void mouseClicked() {
  // When the mouse button is pressed get the corresponding pixel
  // value. If it is a button color (red, green, blue), send a 
  // message to the vroom message queue. This should result in a 
  // color change if the vroom application is running.
  
  println("[mouseClicked] pos=(" + mouseX + ", " + mouseY + ")");

  loadPixels();
  
  int index = mouseY*width + mouseX;
  String color_value = hex(pixels[index]);
  
  println("  -- pixel: hex=" + color_value);

  try {
    if (color_value.equals("FFFF0000") == true) {
       println("  -- hit: color=red");
       stream.sendMessage(queue, "red");
    } else if (color_value.equals("FF00FF00") == true) {
       println("  -- hit: color=green");
       stream.sendMessage(queue, "green");
    } else if (color_value.equals("FF0000FF") == true) {
       println("  -- hit: color=blue");
       stream.sendMessage(queue, "blue");
    } else {
    }
  } catch (Exception e) {
    e.printStackTrace(); 
  }
}
