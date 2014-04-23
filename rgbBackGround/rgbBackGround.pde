import processing.serial.*;

Serial port; 

String data = "";
int index = 0;
int index2 = 0;

String red_str = "";
String blue_str = "";
String grn_str = "";

int grn_val = 0;
int red_val = 0;
int blue_val = 0;


void setup()
{
 size(300,300);
 port = new Serial(this, "COM6", 9600);
 
 port.bufferUntil('.');
  
}

void draw()
{
  background(red_val, blue_val, grn_val);
}

void serialEvent(Serial port)
{
 data = port.readStringUntil('.');
 data = data.substring(0, data.length() - 1);
 
 index = data.indexOf(",");
 index2 = data.indexOf("+");
 
 red_str = data.substring(0, index);
 blue_str = data.substring(index+1, index2);
 grn_str= data.substring(index2+1, data.length());
 
 red_val= Integer.parseInt(red_str);
 blue_val = Integer.parseInt(blue_str); 
 grn_val = Integer.parseInt(grn_str);
}


