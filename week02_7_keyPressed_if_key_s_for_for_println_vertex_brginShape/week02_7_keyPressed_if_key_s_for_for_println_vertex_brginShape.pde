//week02_7_keyPressed_if_key_s_for_for_println_vertex_brginShape
//想要把畫出來的座標變成我們的程式碼!!
ArrayList<Integer> x,y;  //先有兩個｢還沒準備好｣的小資料結構,等Mousepressed再新增準備
ArrayList<ArrayList<Integer>> xx=new ArrayList<ArrayList<Integer>>();//大的資料結構
ArrayList<ArrayList<Integer>> yy=new ArrayList<ArrayList<Integer>>();
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.jpg");  //每次新的檔案都要把圖拉進來一次
}  //記得把圖檔像上周一樣拉進程式碼裡
void draw(){
  background(img);
  fill(255,200);  //半透明的色彩 白色,alpha值是128
  rect(0,0,400,400);  //畫超大四邊形全部蓋住
  //上面是week02_4,下面用迴圈,從資料結構取出來
  for(int I=0;I<xx.size();I++){  //大寫I 對應大的資料結構
    ArrayList<Integer> x=xx.get(I);  //取出裡面小的資料結構
    ArrayList<Integer> y=yy.get(I);
    for(int i=1 ; i<x.size() ;i++){  //小的,再照舊畫
    line(x.get(i) ,y.get(i) ,x.get(i-1) ,y.get(i-1));
  }
  }
}
void keyPressed(){  //小心注音輸入法會卡住按鍵  要記得換英文輸入
  if(key=='s' || key=='S'){  //如果按下英文的小寫或大寫S 想save的話
    for(int I=0;I<xx.size();I++){  //大寫I 對應大的資料結構
      ArrayList<Integer> x = xx.get(I);  //取出裡面小的資料結構
      ArrayList<Integer> y = yy.get(I);
      println("beginShape();");  //beginShape()
      for(int i=1;i<x.size();i++){ //小的
        println("  vertex("+x.get(i)+","+y.get(i)+");");
      }  //改在keyPressed()按下s或S時,再全部印出來
      println("endShape();");  //endShape()
    }
  }
}
void mouseDragged(){ //mouse Dragged
  //print("vertex(mouseX,mouseY); 錯誤的!!!
  //println("vertex("+mouseX+","+mouseY+");");  //不要在這裡印
  x.add(mouseX);
  y.add(mouseY);
}
void mousePressed(){  //mouse Pressed  滑鼠按下去時,建｢新的｣資料結構
  x= new ArrayList<Integer>(); xx.add(x);
  y= new ArrayList<Integer>(); yy.add(y);
}
