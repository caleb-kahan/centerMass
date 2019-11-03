class Semicircle extends Shape{
  float radius;
  
  Semicircle(int x, int y, int radius){
    super(x,y);
    this.radius = radius;
  }
  float calculateArea(){
    return radius * radius * HALF_PI;
  }
  void display(){
    if (mouseX - x < 0) arc(x, y, radius, radius, atan((mouseY - y)/(mouseX - x + 0.000001)) - HALF_PI + PI, atan((mouseY - y)/(mouseX - x + 0.000001)) + HALF_PI + PI);
    else arc(x, y, radius, radius, atan((mouseY - y)/(mouseX - x + 0.000001)) - HALF_PI, atan((mouseY - y)/(mouseX - x + 0.000001)) + HALF_PI);
  }
}
