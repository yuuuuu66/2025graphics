//week03_08_bezier_equation
void setup(){
  size(400,400);
}
void draw(){
  background(255);
  int x1=340, x2=40, x3=360, x4=60;
  int y1=80, y2=40, y3=360, y4=320;
  line(x1,y1,x2,y2);
  line(x3,y3,x4,y4);
  bezier(x1,y1,x2,y2,x3,y3,x4,y4); //貝式曲線
  float t=frameCount/200.0%1; //加上%1的話點點就不會飛出去 會在曲線中循環
  float t2=1-t;
  float x=x1*t2*t2*t2 + 3*x2*t*t2*t2 + 3*x3*t*t*t2 + x4*t*t*t;
  float y=y1*t2*t2*t2 + 3*y2*t*t2*t2 + 3*y3*t*t*t2 + y4*t*t*t;
  ellipse(x,y,10,10);
}
