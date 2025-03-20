//week05_6_pushMatrix_popMatrix_bad
//因為有很多的移動、大腦會亂掉　所以用「分階層」做事
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  translate(width/2,height/2); //(把下面這坨)移到畫面中心
  rotate(radians(frameCount)*10);
  rect(-50,-5,100,10);
  
  //希望左邊-100的地方也在轉 所以寫一段跟上面一樣的 結果整組壞去
  translate(width/2-100,height/2); //(把下面這坨)移到畫面中心
  rotate(radians(frameCount)*10);
  rect(-50,-5,100,10);
}
