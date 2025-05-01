//week11_1_postman_saveString_loadString
//修改自week10_6_postman_many_angle_ID_saveString_loadString
PImage postman, head, body, arm_l, arm_r, leg_l, leg_r, bag;
float [] angle = new float[20]; //準備20個關節的變數
int ID = 0; //現在要處理的關節ID(第幾個關節)
void mouseDragged(){
  angle[ID] += mouseX - pmouseX;
}
void keyPressed(){
  if(key=='1') ID=1;  //左手
  if(key=='2') ID=2;  //右手
  if(key=='3') ID=3;  //左腳
  if(key=='4') ID=4;  //右腳
  if(key=='5') ID=5;  //包包
  if(key=='6') ID=6;  //(待用)
  if(key=='0') ID=0; //頭

  if(key=='s'){  //從這裡開始
    String now =""; //要放現在全部關節
    for(int i=0;i<20;i++){  //利用for迴圈
      now += angle[i]+" "; //全部塞到now裡面，記得有空
    }
    lines.add(now); //把現在的這行，加到lines裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
  }
  if(key=='r'){  //replay,照著之前按's'存檔的lines重播一次
    if(R==0){  //如果目前沒有任何東西
      String [] file = loadStrings("angles.txt");
      if(file != null){ //如果有讀到檔案
        for(int i=0;i<file.length;i++){  //就把檔案內容逐行
          lines.add(file[i]); //加到 lines 資料結構裡
        }
      }
    }
    if(R<lines.size()){
      float [] now = float(split(lines.get(R),' '));
      for(int i=0;i<20;i++) angle[i] = now[i];
      R = (R+1) % lines.size();
    }
  }
}
int R = 0;
ArrayList<String> lines = new ArrayList<String>(); //放移動的結果
void setup(){
  size(560,560);
  postman = loadImage("1.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  arm_l = loadImage("arm_l.png");
  leg_l = loadImage("leg_l.png");
  arm_r = loadImage("arm_r.png");
  leg_r = loadImage("leg_r.png");
  bag = loadImage("bag.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0);  //基礎的郵差先生(全身)
  fill(255,0,255,128);  //半透明的紫色
  rect(0,0,560,560); //蓋上去
  pushMatrix();
    translate(231,253); //再放回去
    rotate(radians(angle[1]));
    translate(-231,-253); 
    image(arm_l,0,0);  //左手
    pushMatrix();
      translate(208,351); //再放回去
      rotate(radians(angle[5]));
      translate(-208,-351); 
      image(bag,0,0);  //包包
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(287,247); //再放回去
    rotate(radians(angle[2]));
    translate(-287,-247); 
    image(arm_r,0,0);  //右手
  popMatrix();
  pushMatrix();
    translate(246,360); //再放回去
    rotate(radians(angle[3]));
    translate(-246,-360); 
    image(leg_l,0,0);  //左腳
  popMatrix();
  pushMatrix();
    translate(282,362); //再放回去
    rotate(radians(angle[4]));
    translate(-282,-362); 
    image(leg_r,0,0);  //右腳
  popMatrix();
  pushMatrix();
    translate(260,230); //再放回去
    rotate(radians(angle[0]));
    translate(-260,-230); 
    image(head,0,0);  //先畫頭
  popMatrix();
  image(body,0,0); //再畫身體
}  
