class Circle extends Shape{
  float radius;
  
  Circle(float x, float y, float radius){
    super(x,y);
    this.radius = radius;
    this.comX = calculateCenterX();
    this.comY = calculateCenterY();
    this.area = calculateArea();
  }
  float calculateArea(){
    return radius * radius * PI;
  }
  void display(){
    stroke(255, 0, 0);
    ellipse(x, y, radius*2, radius*2);
    super.display();
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
