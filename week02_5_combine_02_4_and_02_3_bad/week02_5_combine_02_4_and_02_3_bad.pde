//week02_5_combine_02_4_and_02_3_bad
//要開始描圖 但程式出錯了
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.jpg");
}  //記得把圖檔像上周一樣拉進程式碼裡
void draw(){
  background(img);
  fill(255,200);  //半透明的色彩 白色,alpha值是128
  rect(0,0,400,400);  //畫超大四邊形全部蓋住
  //上面是week02_4,下面是week02_5 
  stroke(255,0,0); //紅色的線
  if(mousePressed) line(mouseX ,mouseY ,pmouseX ,pmouseY );
}
