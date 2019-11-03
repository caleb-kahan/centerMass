class ShapeBuilder{
  int firstX;
  int firstY;
  int secondX;
  int secondY;
  int threeX;
  int threeY;
  String futureShape;
  int numClicks;
  
  
  ShapeBuilder(String futureShape){
    this.futureShape = futureShape;
    this.numClicks = 0;
  }
  
  void run(){
    if(numClicks == 0){
      fill(255,0,0);
      switch(futureShape){
        case "Circle":
          circle(mouseX,mouseY,5);
          break;
        case "Rectangle":
          rect(mouseX,mouseY,5,5);
      }
    }
    if(numClicks ==1 ){
      float dist = distance(firstX,firstY, mouseX, mouseY);
      switch(futureShape){
        case "Circle":
          circle(firstX,firstY,2*dist);
          break;
        case "Rectangle":
          rect(firstX,firstY,2*(mouseX-firstX),2*(mouseY-firstY));
      }
    }
  }
  void modify(){
    if(numClicks ==1){
      firstX = mouseX;
      firstY = mouseY;
    }
  }
  float distance(int x1, int y1, int x2, int y2){
    return sqrt(sq(x2-x1) + sq(y2-y1));
  }
  boolean shouldRun(){
    if(numClicks == 0){
      return false;
    }
    
    else if(numClicks == 1){
      return false;
    }
    
    return true;
  }
  
}
