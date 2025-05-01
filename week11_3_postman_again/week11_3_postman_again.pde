//week11_3_postman_again
//重新來一次 讓程式的架構更清楚
PImage postman, head, body, uparm1, hand1, uparm2, hand2,foot1,foot2;
void setup(){ //把上面的圖 都拉進新專案裡
  size(600,600);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  uparm2 = loadImage("uparm2.png");
  hand1 = loadImage("hand1.png");
  hand2 = loadImage("hand2.png");
  foot1=loadImage("foot1.png"); //增加腳 旋轉中心 220,375
  foot2=loadImage("foot2.png"); //增加腳 旋轉中心 260,372
}
float[] angleX = new float[10]; //在3D的世界裡 我們的旋轉
float[] angleY = new float[10];
int ID = 0; //一開始是頭的關節
ArrayList<String> lines = new ArrayList<String>();
void keyPressed(){
  if(key== 's'){ //現在動作的所有關節都存起來
    String now= ""; //空字串
    for(int i=0;i<10;i++){
      now += angleX[i] + " "; //後面有空格
      now += angleY[i] + " ";
    }
    lines.add(now); //把現在動作的這行 加到lines 裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angle.txt",arr);
    println("現在存檔:" +now);
  }
  if(key=='r'){
    String [] file =loadStrings("angle.txt");
    if(file != null){
      for(int i=0;i<file.length;i++){//就檔案內容逐行
        lines.add(file[i]);
        println("現在讀檔:"+file[i]);
      }
    }
  }
  if(key=='p') playing=!playing; //播動畫 <=> 不播動畫
  
  if(key=='1') ID = 1; //左臂
  if(key=='2') ID = 2; //左手
  if(key=='3') ID = 3; //右臂
  if(key=='4') ID = 4; //右手
  if(key=='5') ID = 5; //左腳
  if(key=='6') ID = 6; //右腳
  if(key=='0') ID = 0; //頭
}
boolean playing =  false; //一開始不播放動畫 按下p 可切換
void mouseDragged(){
  angleX[ID] += mouseX - pmouseX;
  angleY[ID] += mouseY - pmouseY; //多了這一行
}
int R=0;
void myInterpolate(){ //請勿剪貼老師重寫
  if(lines.size()>=2){ //要有兩行以上才能做內插
    float alpha=(frameCount%30)/30.0;
    if(alpha==0.0) R=(R+1)%lines.size();
    int R2=(R+1)%lines.size();
    float[] oldAngle = float(split(lines.get(R),' '));
    float[] newAngle = float(split(lines.get(R2),' '));
    for(int i=0;i<10;i++){
      angleX[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
      angleY[i] = oldAngle[i*2+1]*(1-alpha) + newAngle[i*2+1]*alpha;
    }
  }
}
void draw(){
  background(#FFFFF2);
  image(body, 0, 0); //先畫身體

  pushMatrix();
    translate(+236, +231); //再放回去正確的位置
    rotate(radians(angleX[0]));
    translate(-236, -231);//把頭的旋轉中心,放到(0, 0)
    image(head, 0, 0); //再畫頭
  popMatrix();
  
  pushMatrix(); //foot1
    translate(220,375);
    rotate(radians(angleX[6]));
    translate(-220,-375);
    image(foot1,0,0);
   popMatrix();
   
   pushMatrix(); //foot2
     translate(260,372);
    rotate(radians(angleX[5]));
    translate(-260,-372);
    image(foot2,0,0);
   popMatrix();
   
    pushMatrix();//左邊上手臂、手肘
    translate(+185, +261); //再放回去正確的位置
    rotate(radians(angleX[1]));
    translate(-185, -261);
    image(uparm1, 0, 0); //再畫上手臂
    pushMatrix();
      translate(+116, +265); //放回去
      rotate(radians(angleX[2]));
      translate(-116, -265);
      image(hand1, 0, 0); //畫手
    popMatrix();
  popMatrix();
  
  pushMatrix(); //要畫右邊的上手臂、手肘
    translate(+290, +262);
    rotate(radians(angleX[3]));
    translate(-290, -262);
    image(uparm2, 0 ,0);
    pushMatrix();
      translate(+357, +259);
      rotate(radians(angleX[4]));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix(); 
}
