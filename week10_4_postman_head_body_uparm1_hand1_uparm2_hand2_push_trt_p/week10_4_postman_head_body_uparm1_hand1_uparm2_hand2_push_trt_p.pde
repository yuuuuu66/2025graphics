//week10_4_postman_head_body_uparm1_hand1_uparm2_hand2_push_trt_pop
//頭、身體、手臂、手肘、腳
PImage postman, head, body, uparm1, hand1, uparm2, hand2;
void setup(){
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
}
void draw(){
  background(#FFFFF2);
  image(postman, 0, 0); //基礎的郵差先生(全身)
  fill(255, 0, 255, 128); //半透明的紫色
  rect(0, 0, 560, 560); //蓋上去
  
  pushMatrix();//左邊上手臂、手肘
    translate(+185, +261); //再放回去正確的位置
    //rotate(radians(mouseX));
    translate(-185, -261);
    image(uparm1, 0, 0); //再畫上手臂
    pushMatrix();
      translate(+116, +265); //放回去
      //rotate(radians(mouseX));
      translate(-116, -265);
      image(hand1, 0, 0); //畫手
    popMatrix();
  popMatrix();
  
  pushMatrix(); //要畫右邊的上手臂、手肘
    translate(+290, +262);
    //rotate(radians(mouseX));
    translate(-290, -262);
    image(uparm2, 0 ,0);
    pushMatrix();
      translate(+357, +259);
      rotate(radians(mouseX));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
  
   pushMatrix();
    translate(+236, +231); //再放回去正確的位置
    //rotate(radians(mouseX));
    translate(-236, -231);//把頭的旋轉中心,放到(0, 0)
    image(head, 0, 0); //再畫頭
  popMatrix();
  image(body, 0, 0); //再畫身體
}
