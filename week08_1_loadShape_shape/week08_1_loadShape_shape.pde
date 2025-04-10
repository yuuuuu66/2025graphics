//week08_1_loadShape_shape
size(400,400,P3D); //step03 要有P3D的OpenGL 3D功能
PShape gundam=loadShape("Gundam.obj"); //step01 讀入3D模型
translate(width/2,height/2); //把下面的東西放到畫面中心
pushMatrix(); //備份矩陣
  translate(0,100);
  scale(10,-10,10); //step04 把模型放大 shape(10)上下要倒過來
  shape(gundam,0,0); //step02 畫出3D模型
popMatrix(); //還原矩陣
