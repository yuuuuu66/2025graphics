//week03_06_lerp_frameCount
void setup(){
  size(400,400);
}
float startX=0 ,startY=0;
float stopX=390 ,stopY=290;
void draw(){
  //background(255);
  ellipse(startX,startY,10,10);
  ellipse(stopX,stopY,10,10);
  //lerp()可以做內插 要給他0.0~1.0之間的數
  float midX = lerp(startX,stopX,frameCount/200.0);
  float midY = lerp(startY,stopY,frameCount/200.0);
  //frameCount 是｢第幾個frame｣ 一小時=60分,1分=60秒,1秒=60 frame
  ellipse(midX,midY,10,10);
}
