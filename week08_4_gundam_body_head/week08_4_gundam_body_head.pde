//week08_4_gundam_body_head
//慢慢把切割開的模型 逐一組合起來
PShape body,head;
void setup(){
  size(400,400,P3D);
  body=loadShape("body.obj");
  head=loadShape("head.obj");
}
void draw(){
  background(255);
  translate(width/2,height/2+100);
  sphere(10);
  
  scale(10,-10,10);
  pushMatrix(); 
    translate(0,22.5); //step03 再掛回原本的地方
    rotate(radians(x)); //step02 轉動 
    //translate(x/10,y/10); //要放小x,y的座標
    //println(x/10,y/10); //印出座標 等等要取上面的數
    translate(0,-22.5);  //step01 我們頭的中心 要放在旋轉中心
    shape(head,0,0);
  popMatrix();
  shape(body,0,0);
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y-=mouseY-pmouseY;
}
