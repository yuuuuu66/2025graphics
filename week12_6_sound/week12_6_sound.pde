//week12_6_sound
//要有聲音 需要聲音的 Library 函式庫
//Sketch - Library - Managed Libraries 找 sound 會看到Sound | Provides a simple way to work with audio
//選它 右下角Install下載安裝
//安裝好Sound後 會有File - Examples 點開 Libraries 核心函式庫 Sound
//Soundfile 那堆範例 看SimplePlayback 簡單播放音樂的範例
import processing.sound.*; //抄範例
SoundFile mySound; //抄範例 改一下變數名
void setup(){
  size(400,400);
  mySound = new SoundFile(this,"music.mp3");
  mySound.play();
}
void draw(){ //記得要有個空的draw()函式

}
