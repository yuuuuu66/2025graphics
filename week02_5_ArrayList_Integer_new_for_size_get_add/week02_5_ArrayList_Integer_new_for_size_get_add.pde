//week02_5_ArrayList_Integer_new_for_size_get_add
//利用資料結構,把歷史軌跡記起來
ArrayList<Integer> x=new ArrayList<Integer>();
ArrayList<Integer> y=new ArrayList<Integer>();
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
  for(int i=1 ; i<x.size() ;i++){
    line(x.get(i) ,y.get(i) ,x.get(i-1) ,y.get(i-1));
  }
}
void mouseDragged(){ //mouse Dragged
  x.add(mouseX);
  y.add(mouseY);
}
