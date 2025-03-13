//week04_14_sun_earth_moon_setTexture
PShape sun,earth,moon;
//樓下 剪貼自week04_08,樓上是 week04_11,12,13
void setup(){
  size(400,400,P3D);
  sun=createShape(SPHERE,100);
  PImage img=loadImage("sun.jpg");
  sun.setTexture(img);
  
  earth=createShape(SPHERE,30);
  img=loadImage("earth.jpg");
  earth.setTexture(img);
  
  moon=createShape(SPHERE,10);
  img=loadImage("moon.jpg");
  moon.setTexture(img);
}
void draw(){
  background(128);
  translate(width/2,height/2);
  shape(sun); //sphere(50);  //太陽
  rotateY(radians(frameCount));
  pushMatrix();
    translate(150,0);
    rotateY(radians(frameCount));
    shape(earth);//sphere(30);  //地球
    pushMatrix();
      translate(50,0);
      rotateY(radians(frameCount));
      shape(moon); //sphere(10);  //月球
    popMatrix();
  popMatrix();
}
