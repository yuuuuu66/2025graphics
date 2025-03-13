//week04_02_atan2_for_x_dy_dx_cos_sin
void setup(){
  size(600,300);
}
void draw(){
  background(#C0FFEE);  //咖啡粉青色
  for(int x=150; x<=450; x+=300){
    ellipse(x,150,100,100);  //大眼睛
    float dx=mouseX-x, dy=mouseY-150; 
    float a=atan2(dy,dx);  //算出角度
    ellipse(x+cos(a)*25,150+sin(a)*25,50,50);
  }
}
