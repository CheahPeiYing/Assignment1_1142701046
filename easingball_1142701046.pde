boolean line = false; 
float x;
float y;

void setup() {
  size(640, 360); 
  noStroke();  
}

void draw() { 
  
  background(255,155,155);
  
  float easing = 0.10;
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
  
  if (line == true) {
  strokeWeight(10);
  stroke(180,53,78);
}
  
if (mousePressed==true) {
ellipse(x,y,100,100);
noStroke();
fill(0);
}

else {
ellipse(x,y,66,66);
noStroke();
fill(255);
}

}

void mouseDragged() {
background (165,189,255);
ellipse(x,y,30,30);
fill(150);
}

void keyPressed() {
  if ((key == 'L') || (key == 'l')) {
    line = true;
  }
}

void keyReleased() {
  line = false;
}




