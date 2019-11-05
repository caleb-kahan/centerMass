class Semicircle extends Shape{
  float radius;
  int secondX;
  int secondY;
  
  Semicircle(int x, int y, float radius, int secondX, int secondY){
    super(x,y);
    this.radius = radius;
    this.secondX = secondX;
    this.secondY = secondY;
  }
  float calculateArea(){
    return radius * radius * HALF_PI;
  }
  void display(){
    if (secondX - x < 0) arc(x, y, radius, radius, atan((secondY - y)/(secondX - x + 0.000001)) - HALF_PI + PI, atan((secondY - y)/(secondX - x + 0.000001)) + HALF_PI + PI);
    else arc(x, y, radius, radius, atan((secondY - y)/(secondX - x + 0.000001)) - HALF_PI, atan((secondY - y)/(secondX - x + 0.000001)) + HALF_PI);
  }
}
