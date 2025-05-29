//week15_02_multiple_window_PGraphics
PGraphics pg; //在外面宣告 每個人都可以用
void setup(){
  size(400,400,P3D); //主要的視窗
  pg=createGraphics(200,200,P3D); //有一個小的
}
void draw(){
  background(255,0,0); //紅色的大背景
  pg.beginDraw();
  pg.background(0,255,0); //綠色的小背景
  pg.translate(100,100);
  pg.rotateY(radians(frameCount));
  pg.box(100);
  pg.endDraw();
  
  image(pg,0,0);
}
