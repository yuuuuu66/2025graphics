//week12_1_gundum_head_body_uparm_upuparm_hand
//修改自 week09_2_gundum_body_push_trt_pop
//再加上 week09_5_gundam_uparm_upuparm_hand_keyboard_mouse_angle
// Ctrl-K 開專案的檔案總管，把 week09_5 的模型 copy 到 week12_1
PShape body,head,uparm1,upuparm1,hand1;
void setup(){
  size(400,400,P3D);
  body=loadShape("body.obj");
  head=loadShape("head.obj");
  uparm1=loadShape("uparm1.obj"); 
  upuparm1=loadShape("upuparm1.obj");
  hand1=loadShape("hand1.obj");
}
void draw(){
  background(204);
  translate(200,300);
  sphere(10); //原點的球
  scale(10,-10,10); //y要上下再反過來
  shape(body,0,0);
  
  pushMatrix();
    translate(0,22.5);
    rotateY(radians(mouseX-200));
    rotateX(radians(mouseY-60));
    translate(0,-22.5);
    shape(head,0,0);
  popMatrix();
  pushMatrix();
    shape(upuparm1,0,0); //上上手臂
    pushMatrix();
      translate(-4.1,19.9); //再放回原本位置
      rotateZ(radians(mouseX));
      translate(4.1,-19.9);
      
      shape(uparm1,0,0); //上手臂
      pushMatrix();
        translate(-4.5,16.9);
        rotateX(radians(mouseX));
        translate(4.5,-16.9);
        //translate(mouseX/10.0,-mouseY/10.0); //一邊移動一邊找適合的數值
        //println(mouseX/10.0,-mouseY/10.0); //印出適合的數值 4.5,-16.9
        shape(hand1,0,0);
      popMatrix();
    popMatrix();
  popMatrix();
}
