//week12_5_gundum_left_copy_right
// 修改自week12_4_gundum_head_body_push_trt_pop_again
//PShape 宣告要複製 要改成2
//void setup()裡 也要複製loadshape 裡面也要改成2
//void draw()裡 也要複製整組TRT 裡面的1變2 x正的變負 負的變正
PShape body, head;
PShape uparm1, upuparm1, hand1;
PShape uparm2, upuparm2, hand2; //week09_5
void setup(){
  size(400,400,P3D);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj"); 
  upuparm1 = loadShape("upuparm1.obj"); 
  hand1 = loadShape("hand1.obj");  
  uparm2 = loadShape("uparm2.obj"); //week09_5
  upuparm2 = loadShape("upuparm2.obj"); //week09_5
  hand2 = loadShape("hand2.obj");  //week09_5
}
float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0; //0:頭 1:上上手臂 2:上手臂 3:手
void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX); //左右拖曳
  angleY[ID] += radians(mouseY - pmouseY); //上下拖曳
}
void keyPressed(){ //小心注音輸入法
  if(key=='1')ID=1; //還沒有設定好上上手臂
  if(key=='2')ID=2; //ok 上手臂
  if(key=='3')ID=3; //ok 手
  if(key=='4')ID=4;
  if(key=='5')ID=5;
  if(key=='6')ID=6;
  if(key=='7')ID=7;
  if(key=='8')ID=8;
  if(key=='9')ID=9;
  if(key=='0')ID=0; //ok頭
}
void draw(){
  background(204); 
  translate(200,300);
  sphere(10); //原點的球

  scale(10, -10, 10); //y要上下反過來
  
  shape(body,0,0);
  pushMatrix();
    translate(0,22.5);
    rotateY(angleX[0]); //week12_2 x方向,左右拖曳,是對y軸轉
    rotateX(angleY[0]); //week12_2 y方向,上下拖曳,是對x軸轉
    translate(0,-22.5);
    shape(head,0,0);
  popMatrix();
  
  pushMatrix(); //左邊的手臂系列
    translate(-2.9,20.8);
    rotateY(angleX[1]); 
    rotateX(angleY[1]);
    translate(2.9,-20.8);
    //利用下面兩行尋找旋轉中心的座標
    //translate(mouseX/10.0,-mouseY/10.0); //一邊移動一邊找適合的數值
    //println(mouseX/10.0,-mouseY/10.0); //印出適合的數值 ex4.0,-20.7
    shape(upuparm1, 0, 0); //上上手臂
    pushMatrix();
      translate(-4.1, 19.9); //再掛回去原本的位置
      //rotateZ(radians(mouseX));
      rotateZ(angleY[2]); //week12_2 x方向,左右拖曳,是對y軸轉
      rotateY(angleX[2]); //week12_2 y方向,上下拖曳,是對x軸轉
      translate(4.1, -19.9);//把物體的旋轉值,放到座標中心
      shape(uparm1, 0, 0); //上手臂
      pushMatrix();
        translate(-4.5, 16.9);
        //rotateX(radians(mouseX));
        rotateX(angleY[3]); //week12_2 x方向,左右拖曳,是對y軸轉
        rotateY(angleX[3]); //week12_2 y方向,上下拖曳,是對x軸轉
        translate(4.5, -16.9); //剛剛把手移到座標中心的移動量
        shape(hand1,0,0);
      popMatrix();
    popMatrix();
  popMatrix();
  
  pushMatrix(); //右邊的手臂系列
    translate(+2.9,20.8);
    rotateY(angleX[4]); 
    rotateX(angleY[4]);
    translate(-2.9,-20.8);
    shape(upuparm2, 0, 0); //上上手臂
    pushMatrix();
      translate(+4.1, 19.9); //再掛回去原本的位置
      //rotateZ(radians(mouseX));
      rotateZ(angleY[5]); //week12_2 x方向,左右拖曳,是對y軸轉
      rotateY(angleX[5]); //week12_2 y方向,上下拖曳,是對x軸轉
      translate(-4.1, -19.9);//把物體的旋轉值,放到座標中心
      shape(uparm2, 0, 0); //上手臂
      pushMatrix();
        translate(+4.5, 16.9);
        //rotateX(radians(mouseX));
        rotateX(angleY[6]); //week12_2 x方向,左右拖曳,是對y軸轉
        rotateY(angleX[6]); //week12_2 y方向,上下拖曳,是對x軸轉
        translate(-4.5, -16.9); //剛剛把手移到座標中心的移動量
        shape(hand2,0,0);
      popMatrix();
    popMatrix();
  popMatrix();
}
