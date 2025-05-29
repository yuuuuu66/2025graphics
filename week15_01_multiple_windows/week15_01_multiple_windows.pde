//week15_01_multiple_windows
//google: processing multiple windows
//File>Examples>Demos>Tests>MultipleWindows
void setup(){
  size(300,200); //小的第1個視窗
  background(255,0,0);
  WindowB child = new WindowB(); //請WindowB做事
}
void draw(){ //要記得放一個空白的
  
}
//以下會獨立執行 WindowB要做的事
class WindowB extends PApplet {
  public WindowB(){ // ｢建構子｣　constructoe
    super(); //呼叫上一層 ｢建構子｣
    PApplet.runSketch(new String[]{this.getClass().getName()},this);
  }
  public void settings(){
    size(300,200);
  }
  public void setup(){
    //size(300,200);
    background(0,255,0);
  }
  public void draw(){
  }
}
