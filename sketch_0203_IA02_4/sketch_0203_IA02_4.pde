import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph

float variableRe;
float photoDe;
float swe;


float variableReS;
float photoDeS;
float photoDe2;
float variableReS2;
///////////random

int vx, vy, vxx, vyy;

int px, py, pxx, pyy;

///////////r/


///////////////kokokara-kopi-

float FRICTION = 0.985;
 
public class Ripple{
  int x,y;
  float dia;
  float speed;
  int colorH;
  boolean flag;
  
  Ripple() {
    init(0,0,0,0);
    flag = false;
  }
 
  public Ripple(Ripple src) {
    this.x = src.x;
    this.y = src.y;
    this.speed = src.speed;
    this.colorH = src.colorH;
    this.dia = src.dia;
    this.flag = src.flag;
  }
 
  public void init(int _x, int _y, float _speed, int _colorH) {
    x = _x;
    y = _y;
    speed = _speed;
    colorH = _colorH;
    dia = 0.0;
    flag = true;
  }
 
  public void rippleDraw() {
    noFill();
  
    if(speed > 1.0) {
      stroke(0, 0, colorH, 100*(speed-1)/3);
      strokeWeight(4);
      ellipse(x,y,dia,dia);
    }
    if(speed > 1.5) {
      stroke(0, 0, colorH, 100*(speed-1.5)/3);
      strokeWeight(2);
      ellipse(x,y,dia*0.7,dia*0.7);
    }
    if(speed > 2.0) {
      stroke(0,0,colorH, 100*(speed-2)/3);
      strokeWeight(1);
      ellipse(x,y,dia*0.6,dia*0.6);
    }
  }
 
  public void move() {
    dia += speed;
    speed *= FRICTION;
    if(speed < 0.2) {
      flag = false;
    }
  }
 
  public boolean getFlag() {
    return flag;
  }
}
//////////////////////////

public class Ripple2{
  int x,y;
  float dia;
  float speed;
  int colorH;
  boolean flag;
  
  Ripple2() {
    init(0,0,0,0);
    flag = false;
  }
 
  public Ripple2(Ripple2 src) {
    this.x = src.x;
    this.y = src.y;
    this.speed = src.speed;
    this.colorH = src.colorH;
    this.dia = src.dia;
    this.flag = src.flag;
  }
 
  public void init(int _x, int _y, float _speed, int _colorH) {
    x = _x;
    y = _y;
    speed = _speed;
    colorH = _colorH;
    dia = 0.0;
    flag = true;
  }
 
  public void rippleDraw() {
    noFill();
  
    if(speed > 1.0) {
      stroke(0, colorH, 0, 100*(speed-1)/3);
      strokeWeight(4);
      ellipse(x,y,dia,dia);
    }
    if(speed > 1.5) {
      stroke(0, colorH, 0, 100*(speed-1.5)/3);
      strokeWeight(2);
      ellipse(x,y,dia*0.7,dia*0.7);
    }
    if(speed > 2.0) {
      stroke(0,colorH,0, 100*(speed-2)/3);
      strokeWeight(1);
      ellipse(x,y,dia*0.6,dia*0.6);
    }
  }
 
  public void move() {
    dia += speed;
    speed *= FRICTION;
    if(speed < 0.2) {
      flag = false;
    }
  }
 
  public boolean getFlag() {
    return flag;
  }
}


//////////////////////////

public class Ripple3{
  int x,y;
  float dia;
  float speed;
  int colorH;
  boolean flag;
  
  Ripple3() {
    init(0,0,0,0);
    flag = false;
  }
 
  public Ripple3(Ripple3 src) {
    this.x = src.x;
    this.y = src.y;
    this.speed = src.speed;
    this.colorH = src.colorH;
    this.dia = src.dia;
    this.flag = src.flag;
  }
 
  public void init(int _x, int _y, float _speed, int _colorH) {
    x = _x;
    y = _y;
    speed = _speed;
    colorH = _colorH;
    dia = 0.0;
    flag = true;
  }
 
  public void rippleDraw() {
    noFill();
  
      stroke(colorH, colorH, colorH, 50);
      strokeWeight(2);
      ellipse(x,y,dia,dia);

  }
 
  public void move() {
    dia += 8;
    speed *= FRICTION;
    if(speed < 0.1) {
      flag = false;
    }
  }
 
  public boolean getFlag() {
    return flag;
  }
}






//////////////////////////
int SIZE = 20;
int SIZE2 = 1000;
Ripple[] ripples = new Ripple[SIZE];
Ripple2[] ripples2 = new Ripple2[SIZE];
Ripple3[] ripples3 = new Ripple3[SIZE2];

///////////////



void setup () {
  // set the window size:
  size(400, 300);
  
    if (frame != null) {
    frame.setResizable(true);
  }
  
  
  ////////////rand
  
  vxx = width/5;
  vyy = height/5;
  
  
  pxx = width/5*4;
  pyy = height/5*4;
  
  ///////////r/
  
  
  

  // List all the available serial ports
  println(Serial.list());
  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  int serialPortIndex = 5;
  myPort = new Serial(this, Serial.list()[serialPortIndex], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  // set inital background:
  background(0);
  println("initialized serial port on " + serialPortIndex);
  
  ///////////////kokokara
  
  colorMode(RGB,255);
  smooth();
  frameRate(30);
  
  for(int i=0;i<SIZE;i++) {
    ripples[i] = new Ripple();
    ripples2[i] = new Ripple2();
//    ripples3[i] = new Ripple3();
  }
  
   for(int i=0;i<SIZE2;i++) {
    ripples3[i] = new Ripple3();
  }
  
  
  ///////////////kokomade
  
  
  
  
}
void draw () {
  // everything happens in the serialEvent()
  
  ///////////////
  
    background(0);
  
  for(int i=0;i<SIZE;i++) {
    if(ripples[i].getFlag()) {
      ripples[i].move();
      ripples[i].rippleDraw();
    }
    
      if(ripples2[i].getFlag()) {
      ripples2[i].move();
      ripples2[i].rippleDraw();
    }
    
      if(ripples3[i].getFlag()) {
      ripples3[i].move();
      ripples3[i].rippleDraw();
    }
    
    
  }
  
  
  
  
  ///////////////
  
  ///////////////moji
  
fill(255, 255, 255, 90);
textSize(16);
text("A1", (width/5), (height-14));
text("A0", (width/5*4), (height-14));
text("D0", (width/2), (height-14));

stroke(0, 255, 0, 80);
strokeWeight(2);
noFill();
ellipse((width/5*4-10),(height-20),8,8);

stroke(0, 0, 255);
strokeWeight(2);
noFill();
ellipse((width/5-10),(height-20),8,8);

stroke(255, 255, 255, 80);
strokeWeight(2);
noFill();
ellipse((width/2-10),(height-20),8,8);

  
  
  
  
  
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    
    int sensors[] = int(split(inString, ','));
    
    if (sensors.length > 1) {
    variableRe = map(sensors[0], 0, 1023, 0, 230);
    variableReS = map(sensors[0], 0, 1023, 0, 8);
    photoDe = map(sensors[1], 0, 1023, 50, 255);
    photoDeS = map(sensors[1], 0, 1023, 0, 8);
    photoDe2 = map(sensors[1], 0, 1023, 0, 18);
//    variableReS2 = map(sensors[1], 0, 1023, 0, 20);

    swe = map(sensors[2], 0, 1, 0, 255);
    }
    
    
    
    
    
    
//    float inByte = float(inString); 
//    float yPixelVal  = map(inByte, 0, 1023, 0, 255);

    // draw the line:

//////////////


  
  
////////////////rand

 vx = ceil(random(-(width/10+(variableReS*2)),width/10+(variableReS*2)));
  vy = ceil(random(-(height/10+(variableReS*2)),height/10+(variableReS*2)));

  vxx += vx; // 速度の分、座標を変える
  vyy += vy;
  if(vxx > width){ // 画面外に出たら
    vxx = width; // 速度を逆向きにする
  }
  
    if(vxx < width/3*2){ // 画面外に出たら
    vxx = width/3*2; // 速度を逆向きにする
  }
  
  
  if(vyy > height){ // 画面外に出たら
    vyy = height; // 速度を逆向きにする
  }
  
    if(vyy < 0){ // 画面外に出たら
    vyy = 0; // 速度を逆向きにする
  }
  
  
  
  
  
  
  
  px = ceil(random(-(width/10+(photoDeS*2)),width/10+(photoDeS*2)));
  py = ceil(random(-(height/10+(photoDeS*2)),height/10+(photoDeS*2)));

  pxx += px; // 速度の分、座標を変える
  pyy += py;
  if(pxx > width/3){ // 画面外に出たら
    pxx = width/3; // 速度を逆向きにする
  }
  
    if(pxx < 0){ // 画面外に出たら
    pxx = 0; // 速度を逆向きにする
  }
  
  
  if(pyy > height){ // 画面外に出たら
    pyy = height; // 速度を逆向きにする
  }
  
    if(pyy < 0){ // 画面外に出たら
    pyy = 0; // 速度を逆向きにする
  }
  
  

//////////////r/
 
 
 
   for(int i=SIZE-1;i>0;i--) {
    ripples[i] = new Ripple(ripples[i-1]);
  }
//  ripples[0].init(pxx,pyy,int(photoDeS),int(photoDe));
    ripples[0].init(pxx, pyy, int(photoDe2), int(photoDe));  
  
    for(int i=SIZE-1;i>0;i--) {
    ripples2[i] = new Ripple2(ripples2[i-1]);
  }
  ripples2[0].init(vxx,vyy,int(variableReS),int(variableRe));
  
  
    for(int i=SIZE-1;i>0;i--) {
    ripples3[i] = new Ripple3(ripples3[i-1]);
  }
  ripples3[0].init(width/2,height/2,20,int(swe));
  

//////////////



  }
}

