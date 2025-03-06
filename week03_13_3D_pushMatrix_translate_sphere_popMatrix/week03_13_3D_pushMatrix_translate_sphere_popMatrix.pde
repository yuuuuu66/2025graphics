//week03_13_3D_pushMatrix_translate_sphere_popMatrix
void setup(){
  size(600,400,P3D);
}
void draw(){
  background(128); 
  lights();
  pushMatrix(); //備份矩陣
    translate(300,100); //習慣上要往右縮一單位(圖學課專屬
    rotateY(radians(frameCount));
    sphere(100);
  popMatrix(); //還原矩陣
  //要備份矩陣跟還原矩陣 就不會出錯 
  pushMatrix();
    translate(100,100);
    rotateY(radians(frameCount));
    sphere(100);
  popMatrix(); 
}
