class Circle extends Shape{
  float radius;
  
  Circle(int x, int y, float radius){
    super(x,y);
    this.radius = radius;
  }
  float calculateArea(){
    return radius * radius * PI;
  }
  void display(){
    stroke(255, 0, 0);
    ellipse(x, y, radius*2, radius*2);
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
