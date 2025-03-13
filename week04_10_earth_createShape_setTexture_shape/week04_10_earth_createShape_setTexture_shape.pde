//week04_10_earth_createShape_setTexture_shape
//googleLearth map texture 下載1張地球的圖片 earth.jpg
//把圖檔拉進程式裡
size(400,400,P3D);
PShape earth=createShape(SPHERE,100);
PImage img =loadImage("earth.jpg");
earth.setTexture(img);
shape(earth);
