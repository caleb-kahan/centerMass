class Circle extends Shape{
  float radius;
  
  Circle(int x, int y, int radius){
    super(x,y);
    this.radius = radius;
  }
  float calculateArea(){
    return radius * radius * PI;
  }
  void display(){
    ellipse(x, y, radius*2, radius*2);
  }
}
