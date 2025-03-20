//week05_4_translate_mouseX_mouseY_rotate_radians_frameCount
//比較rotate 與 translate的順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  //請做以下測試: 把以下兩行調一下順序
  //會發現: 畫東西之前的translate()才有效果
  //在電腦圖學裡, 畫圖時, 會照著之前的程式碼｢累積的移動、旋轉｣來控制東西(圖)
  translate(mouseX,mouseY);//移動到滑鼠所在位置
  rotate(radians(frameCount));
  //frameCount 1秒有60個frame 所以1秒轉60度,要變radians單位
  rect(-50,-5,100,10); //寬度100的棒子,但放在左上角
}
