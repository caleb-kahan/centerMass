class ShapeBuilder{
  int firstX;
  int firstY;
  int secondX;
  int secondY;
  int thirdX;
  int thirdY;
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
        case "CircSegment":
          arc(mouseX, mouseY, 5, 5, 0, HALF_PI, CHORD);
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
        case "CircSegment":
          float r = dist / sqrt(2);
          float xc = (firstX + mouseY - firstY + mouseX)/2;
          float yc = (firstX + mouseY + firstY - mouseX)/2;
          if (mouseX - xc < 0) arc(xc, yc, 2 * r, 2 * r, atan((mouseY - yc)/(mouseX - xc )) + PI, atan((mouseY - yc)/(mouseX - xc)) + PI + HALF_PI, CHORD);
          else arc(xc, yc, 2 * r, 2 * r, atan((mouseY - yc)/(mouseX - xc)), atan((mouseY - yc)/(mouseX - xc )) + HALF_PI, CHORD);
          break;
      }
    }
    if(numClicks == 2){
      switch(futureShape){
        case "Triangle":
          fill(255);
          stroke(255, 0, 0);
          beginShape(TRIANGLES);
          vertex(firstX,firstY);
          vertex(secondX,secondY);
          vertex(mouseX,mouseY);
          endShape();
        case "Rectangle":
          pushMatrix();
          translate(firstX,firstY);
          rotate(angle(firstX,firstY));
          translate(-firstX,-firstY);
          rect(firstX,firstY,2*(secondX-firstX),2*(secondY-firstY));
          popMatrix();
        case "Ellipse":
          pushMatrix();
          translate(firstX,firstY);
          rotate(angle(firstX,firstY));
          translate(-firstX,-firstY);
          ellipse(firstX,firstY,2*(secondX-firstX),2*(secondY-firstY));
          popMatrix();

      }
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
    if(numClicks ==3){
      thirdX = mouseX;
      thirdY = mouseY;
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
    else if(numClicks == 2 && (futureShape.equals("Triangle") ||
                               futureShape.equals("Rectangle") || 
                               futureShape.equals("Ellipse"))){
      return false;
    }
    
    return true;
  }
  Shape build(){
    switch(futureShape){
        case "Circle":
          return new Circle(firstX,firstY,dist(firstX,firstY,secondX,secondY));
        case "Rectangle":
          return new Rectangle(firstX,firstY,2*(secondX-firstX),2*(secondY-firstY),thirdX,thirdY);
        case "Triangle":
          return new Triangle(firstX,firstY,secondX,secondY,thirdX,thirdY);
        case "Ellipse":
          return new Ellipse(firstX,firstY,2*(secondX-firstX),2*(secondY-firstY),thirdX,thirdY);
        case "Semicircle":
          return new Semicircle(firstX,firstY,dist(firstX,firstY,secondX,secondY),secondX,secondY);
        case "Quarter_Circle":
          return new Quarter_Circle(firstX,firstY,dist(firstX,firstY,secondX,secondY),secondX,secondY);
        case "CircSegment":
          return new CircSegment((firstX + secondY - firstY + secondX)/2,(firstX + secondY + firstY - secondX)/2,dist(firstX,firstY,secondX,secondY)/sqrt(2),firstX,firstY,secondX,secondY);
    }
   return null;
  }
  float angle(float x, float y){
    if(mouseX-x>0)
      return atan((mouseY-y+0.000001)/(mouseX-x+0.0000001));
    else
      return atan((mouseY-y+0.0000001)/(mouseX-x+0.0000001)) + PI;
  }
  
}
