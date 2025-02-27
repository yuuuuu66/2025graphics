//week02_2_for_for_if_rect
size(400,400);
background(255);
fill(238);
noStroke();
float s=400/14;  //計算 每個格子的大小
for(int i=0;i<14;i++){  //左手i對應y座標
  for(int j=0;j<14;j++){  //右手j對應x座標
    //rect(0,s*i*2,s,s);  //先試一下位置
    if( (i+j)%2==0) rect(j*s,i*s,s,s);  //這邊才是真的程式碼 完成畫格子的任務
  }
}
