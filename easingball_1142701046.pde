float x; 
float y;

//set up of background 
void setup() {
  size(800,400); 
  cursor (MOVE); //move cursor CURSORICON
}

void draw() { 
 
  background(255,155,155); //bg color
  
  //rectangle bg
  if (mouseX < 400) {
    fill (104,100,167);
    rect(0, 0, 400, 400); // left
    
  } else {
    fill(182,178,255);
    rect(400, 0, 800, 400); // right   
  }
  
  float easing = 0.10; //easing speed
  float targetX = mouseX; 
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 70,70); //easing ball
  fill(255);
  ellipse(mouseX-10,mouseY-10,30,30); //smaller ball 

//mouse press, ball turns black and bigger
if (mousePressed==true) {
fill(0);
ellipse(x,y,100,100);
}

//ball stays the same
else {
fill(255);
ellipse(x,y,70,70);
noStroke();

}

//if 'A' is pressed, blue square appears on right screen
 if ((keyPressed == true) && (key == 'A')){
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



