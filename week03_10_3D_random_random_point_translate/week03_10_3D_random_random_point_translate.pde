//week03_10_3D_random_random_point_translate
float [] x=new float[5000];
float [] y=new float[5000];
float [] z=new float[5000];
void setup(){
  size(400,400,P3D);
  for(int i=0;i<5000;i++){
    x[i]=random(400);
    y[i]=random(400);
    z[i]=random(-400,400);
  }
}
void draw(){
  background(0); //黑色的背景
  stroke(255); //白色的線條
  translate(0,0,mouseY);
  for(int i=0;i<5000;i++){
    point(x[i],y[i],z[i]); //現在只有2D的點 沒有z座標
  }
}
