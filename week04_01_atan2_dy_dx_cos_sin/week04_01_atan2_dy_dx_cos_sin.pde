//week04_01_atan2_dy_dx_cos_sin
void setup(){
  size(600,300);
}
void draw(){
  background(#C0FFEE);  //咖啡粉青色
  ellipse(150,150,100,100);  //大眼睛
  float dx=mouseX-150, dy=mouseY-150; 
  float a=atan2(dy,dx);  //算出角度
  ellipse(150+cos(a)*25,150+sin(a)*25,50,50);
}
