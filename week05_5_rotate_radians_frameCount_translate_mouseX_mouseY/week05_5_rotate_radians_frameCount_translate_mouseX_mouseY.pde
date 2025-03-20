//week05_5_rotate_radians_frameCount_translate_mouseX_mouseY
//比較rotate 與 translate的順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  //請做以下測試: 把以下兩行調一下順序
  //會發現: 兩行順序不同,一個自轉一個公轉 04是自轉 05是公轉
  //在電腦圖學裡, 畫圖時, 會照著之前的程式碼｢累積的移動、旋轉｣來控制東西(圖)
  rotate(radians(frameCount));
  //frameCount 1秒有60個frame 所以1秒轉60度,要變radians單位
  translate(mouseX,mouseY);//移動到滑鼠所在位置
  rect(-50,-5,100,10); //寬度100的棒子,但放在左上角
}
