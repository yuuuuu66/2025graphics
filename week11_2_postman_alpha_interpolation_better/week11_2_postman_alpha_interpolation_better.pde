// week11_2_postman_alpha_interpolation
PImage postman, head, body, uparm1, hand1, uparm2, hand2;
float [] angle = new float[20]; // 準備20個關節的變數
int ID = 0; // 現在要處理的關節 ID (第幾個關節)
void mouseDragged(){
  angle[ID] += mouseX - pmouseX;
} // 記得把圖檔拉進來哦!!!!
void keyPressed(){
  if(key=='1') ID = 1; // 左邊臂
  if(key=='2') ID = 2; // 左邊手
  if(key=='3') ID = 3; // 右邊臂
  if(key=='4') ID = 4; // 右邊手
  if(key=='5') ID = 5; // (待用)
  if(key=='6') ID = 6; // (待用)
  if(key=='0') ID = 0; // 頭
   
  if(key=='s'){ // 從這裡開始 每次按 's' 就存一組 angle
    String now = ""; // 要放現在全部的關節的值
    for(int i=0; i<20; i++){ // 利用 for 迴圈
      now += angle[i] + " "; // 全部塞到 now 裡, 記得有空
    }
    lines.add(now); // 把現在的這行, 加到 lines 裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt", arr);
  }
  if(key=='r'){ // replay, 照著之前按 's' 存檔的 lines 重播一次 
    if(R==0){ // 如果目前的沒有任何東西
      String [] file = loadStrings("angles.txt"); 
      if(file != null){ // 如果有讀到檔案
        for(int i=0; i<file.length; i++){ // 就檔案內容逐行
          lines.add(file[i]); // 加到 lines 資料結構裡
        }
      }
    } 
    if(R<lines.size()){
      float [] now = float(split( lines.get(R), ' '));
      for(int i=0; i<20; i++) angle[i] = now[i];
      R = (R+1) % lines.size();
    }
  }
  //if(key=='p'){ // 按了r之後,想要內插中間的結果
  //  int R2 = (R+1)%lines.size();
  //  float [] oldAngle = float(split(lines.get(R), ' '));
  //  float [] newAngle = float(split(lines.get((R+1)%lines.size()), ' '));
  //  float alpha = (frameCount%30)/30.0; // 介於0.0~1.0中間的值
  //  for(int i=0;i<20;i++) angle[i] = oldAngle[i]*(1-alpha) + newAngle[i]*alpha;
  //}
}
int R = 0;
ArrayList<String> lines = new ArrayList<String>(); // 放移動的結果 
// 到這裡結束
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
void myInterpolate(){
  if(lines.size()>0){
    float alpha = (frameCount%30)/30.0; // 介於0.0~1.0中間的值
    if(alpha==0.0) R = (R+1)%lines.size(); //如果變到0.0就換下一組
    int R2 = (R+1)%lines.size();
    float [] oldAngle = float(split(lines.get(R), ' '));
    float [] newAngle = float(split(lines.get((R+1)%lines.size()), ' '));
    for(int i=0;i<20;i++) angle[i] = oldAngle[i]*(1-alpha) + newAngle[i]*alpha;
  }
}
void draw(){
  myInterpolate();
  background(#FFFFF2);
  image(postman, 0, 0); // 基礎的郵差先生(全身)
  fill(255, 0, 255, 128); // 半透明的紫色
  rect(0, 0, 560, 560); // 蓋上去
  pushMatrix(); // 要畫左邊的上手臂、手肘
    translate(+185, +261);
    rotate(radians(angle[1]));
    translate(-185, -261);
    image(uparm1, 0, 0); // 上手臂
    pushMatrix();
      translate(+116, +265);
      rotate(radians(angle[2]));
      translate(-116, -265);
      image(hand1, 0, 0);
    popMatrix();
  popMatrix();
  
  pushMatrix(); // 要畫右邊的上手臂、手肘
    translate(290, 262);
    rotate(radians(angle[3]));
    translate(-290, -262);
    image(uparm2, 0, 0);
    pushMatrix();
      translate(357, 259);
      rotate(radians(angle[4]));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(angle[0]));
    translate(-236, -231); // 把頭的旋轉中心, 放到(0,0)
    image(head, 0, 0); // 再畫頭
  popMatrix();
  image(body, 0, 0); // 再畫身體
}
