//week02_4_PImage_loadImage_background_fill_println
//新的開始 要描圖
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.jpg");
}  //記得把圖檔像上周一樣拉進程式碼裡
void draw(){
  background(img);
  fill(255,128);  //半透明的色彩 白色,alpha值是128
  println(mouseX);  //把mouseX的值,在下面｢小黑｣印出來
  rect(0,0,400,400);  //畫超大四邊形全部蓋住
}
