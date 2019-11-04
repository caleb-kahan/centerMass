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
      stroke(255);
      switch(futureShape){
        case "Circle":
          circle(mouseX,mouseY,5);
          break;
        case "Rectangle":
          rect(mouseX,mouseY,5,5);
          break;
        case "Quarter_Circle":
          arc(mouseX, mouseY, 5, 5, 0, HALF_PI);
          break;
        case "Semicircle":
          arc(mouseX, mouseY, 5, 5, 0, PI);
          break;
        case "Ellipse":
          ellipse(mouseX,mouseY,5,5);
          break;
        case "Triangle":
          line(mouseX, mouseY, mouseX + 5, mouseY + 5);
          break;
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
          break;
        case "Quarter_Circle":
          if (mouseX - firstX < 0) arc(firstX, firstY, 2*dist, 2*dist, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) - QUARTER_PI + PI, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) + QUARTER_PI + PI);
          else arc(firstX, firstY, 2*dist, 2*dist, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) - QUARTER_PI, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) + QUARTER_PI);
          break;
        case "Semicircle":
          if (mouseX - firstX < 0) arc(firstX, firstY, 2*dist, 2*dist, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) - HALF_PI + PI, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) + HALF_PI + PI);
          else arc(firstX, firstY, 2*dist, 2*dist, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) - HALF_PI, atan((mouseY - firstY)/(mouseX - firstX + 0.000001)) + HALF_PI);
          break;
        case "Ellipse":
          ellipse(firstX,firstY,2*(mouseX-firstX),2*(mouseY-firstY));
          break;
        case "Triangle":
          line(firstX, firstY, mouseX, mouseY);
          break;
      }
    }
    if(numClicks == 2){
      fill(255);
      beginShape(TRIANGLES);
      vertex(firstX,firstY);
      vertex(secondX,secondY);
      vertex(mouseX,mouseY);
      endShape();
    }
  }
  void modify(){
    if(numClicks ==1){
      firstX = mouseX;
      firstY = mouseY;
    }
    if(numClicks ==2){
      secondX = mouseX;
      secondY = mouseY;
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
    else if(numClicks == 2 && futureShape.equals("Triangle")){
      return false;
    }
    
    return true;
  }
  Shape build(){
    switch(futureShape){
        case "Circle":
        case "Rectangle":
          return new Rectangle(firstX,firstY,secondX,secondY);
    }
   return null;
  }
  
}
