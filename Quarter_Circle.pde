class Quarter_Circle extends Shape{
  float radius;
  
  Quarter_Circle(int x, int y, int radius){
    super(x,y);
    this.radius = radius;
  }
  float calculateArea(){
    return radius * radius * QUARTER_PI;
  }
  void display(){
    if (mouseX - x < 0) arc(x, y, radius, radius, atan((mouseY - y)/(mouseX - x + 0.000001)) - QUARTER_PI + PI, atan((mouseY - y)/(mouseX - x + 0.000001)) + QUARTER_PI + PI);
    else arc(x, y, radius, radius, atan((mouseY - y)/(mouseX - x + 0.000001)) - QUARTER_PI, atan((mouseY - y)/(mouseX - x + 0.000001)) + QUARTER_PI);
  }
}
