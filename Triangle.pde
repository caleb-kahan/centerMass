class Triangle extends Shape{
  float x1;
  float y1;
  float x2;
  float y2;
  
  Triangle(int x, int y, float x1, float y1, float x2, float y2){
    super(x,y);
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  float calculateArea(){
    return abs(x * (y1 - y2) + x1* (y2 - y) + x2 * (y - y1)) /2;
  }
  void display(){
    stroke(255, 0, 0);
    beginShape(TRIANGLES);
    vertex(x,y);
    vertex(x1,y1);
    vertex(x2,y2);
    endShape();
  }
  float calculateCenterX(){
    return (x + x1 + x2)/3.;
  }
  float calculateCenterY(){
    return (y + y1 + y2)/3.;
  }
}
