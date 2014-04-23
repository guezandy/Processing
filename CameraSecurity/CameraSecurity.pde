/**
 * Getting Started with Capture.
 * 
 * Reading and displaying an image from an attached Capture device. 
 */ 
 
import processing.video.*;
import processing.serial.*;

Capture cam;
Serial myPort;
int val;
int dataInt;
String data;

void setup() {
  size(640, 480, P2D);
  myPort = new Serial(this, "COM6", 9600);
  myPort.bufferUntil('.');
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
void serialEvent(Serial port)
{
 data = port.readStringUntil('.');
 data = data.substring(0, data.length() - 1); 
 dataInt = Integer.parseInt(data);
}
void draw() {
    if (cam.available() == true) {
      if(dataInt == 1) {
        cam.read();
        image(cam, 0, 0);
      } else {
        cam.stop();
      }
    }
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}
