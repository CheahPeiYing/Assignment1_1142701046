import controlP5.*;
ControlP5 cp5; //initiate controlp5

ColorPicker cp; //colorpicker

Textarea myTextarea; //forframerate

Println console; //console

float x; //declare x
float y; //declare y

ControlP5 cp5Knob;
int ballValue=50;
int cursorballvalue=100;

Knob myKnob;

//set up of background 
void setup() {
  size(800,400); 
  cursor (ARROW); //move cursor CURSORICON
  frameRate(90);
  
  cp5 = new ControlP5(this); //PICKER
  cp = cp5.addColorPicker("picker")
          .setPosition(60, 300)
          .setColorValue(color(0, 0, 0, 0));
          
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10); //showframerate 
  
    myTextarea = cp5.addTextarea("txt") 
                  .setPosition(60, 200)
                  .setSize(100, 80)
                  .setFont(createFont("", 12))
                  .setLineHeight(10)
                  .setColor(color(200))
                  .setColorBackground(color(100))
                  .setColorForeground(color(200,100));
  ;

  console = cp5.addConsole(myTextarea);
   
    cp5Knob = new ControlP5(this);
  myKnob = cp5.addKnob("ballValue")
               .setRange(0,255)
               .setValue(50)
               .setPosition(210,210)
               .setRadius(30)
              
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(24, 75, 61))
               .setColorActive(color(255))
               .setDragDirection(Knob.HORIZONTAL);    
           
    cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("cursorballvalue") //slider
     .setPosition(90,370)
     .setRange(0,255)
     ;
}



void draw() { 
 
   background(cp.getColorValue()); //colorchange

  //two colors rectangle bg
  if (mouseX < 400) {
    fill (104,100,167);
    rect(0, 0, 400, 400); // left
    } 
    
    else {
    fill(182,178,255);
    rect(400, 0, 800, 400); // right   
  }
   
  fill(ballValue); //knobvalue
  ellipse(x, y, 70,70); //easing ball
  fill(cursorballvalue,0,20); //cursorballvalue slider
  ellipse(mouseX-10,mouseY-10,30,30); //smaller cursor ball 
 
  
  //normal easing speed with no key
  float easing = 0.03; //easing speed 1
  float targetX = mouseX; 
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  //faster easing speed when '1' is pressed
  if ((keyPressed == true) && (key == '1')){

  float easing2 = 0.05; //easing speed 2
  float targetX2 = mouseX; 
  float dx2 = targetX2 - x;
  x += dx2 * easing2;
  
  float targetY2 = mouseY;
  float dy2 = targetY2 - y;
  y += dy2 * easing2;
}



//fastest easing speed when '2' is pressed
else if ((keyPressed == true) && (key == '2')) {
  
  float easing3 = 0.15; //easing speed 3
  float targetX3 = mouseX; 
  float dx3 = targetX3 - x;
  x += dx3 * easing3;
  
  float targetY3 = mouseY;
  float dy3 = targetY3 - y;
  y += dy3 * easing3;
}

//mouse press, ball turns black and bigger
if (mousePressed==true) {
fill(0);
ellipse(x,y,100,100);
 println(frameCount);
}

//ball stays the same
else {
fill(ballValue);
ellipse(x,y,70,70);
noStroke();

}

//if 'a' is pressed, blue square appears on right screen
 if ((keyPressed == true) && (key == 'a')){
 fill(140,0,255);
 rect(600,200,100,100);
 }
 
   //outline of ball and rect
  if (line == true) {
  strokeWeight(8);
  stroke(180,53,78);
}

//if left or right key is pressed, black square appears
if (key == CODED) { 
    if (keyCode == LEFT) {
     fill(0);
      rect (50,30,30,30);
    } else if (keyCode == RIGHT) {
      fill(0);
      rect (725,30,30,30);
    }
  }
  loop(); //loop draw
  }




//if mouse is dragged, small ball turns rainbow colored
void mouseDragged() {
fill(random(255),random(255),random(255));
ellipse(mouseX-10,mouseY-10,30,30); //smaller ball 
}

boolean line = false; //outline of balls and box
//if L or l is pressed, red outline of balls and box appears
void keyPressed() {
  if ((key == 'L') || (key == 'l')) {
    line = true;
  }
}

//if L or l is released, outline of both dissapears
void keyReleased() {
  line = false;
}





