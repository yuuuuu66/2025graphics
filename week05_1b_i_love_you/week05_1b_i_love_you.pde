//week05_1b_i_love_you
size(300,300);
stroke(255,0,0);//red line
translate(width/2 , height/2);//translate(150,150);
for(int xx=-150; xx<150;xx++){//大的x -150...150
  for(int yy=-150; yy<150;yy++){//大的y -150...150
    float x = xx/100.0;//除100 -1.5..+1.5
    float y = -yy/100.0;//除100 -1.5..1.5
      // 0..300變-150..+150 變 -1.5 ~ +1.5
    float d = x*x +y*y -1;
    if(d*d*d - x*x*y*y*y < 0) point(xx,yy);
  }

}
