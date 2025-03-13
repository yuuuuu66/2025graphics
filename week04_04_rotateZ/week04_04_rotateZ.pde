//week04_04_rotateZ
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2,height/2);
  rotateZ(radians(mouseX)); 
  ellipse(0,0,100,150);
}
