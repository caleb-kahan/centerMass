class Quarter_Circle extends Shape{
  float radius;
  int secondX;
  int secondY;
  float angle;
  
  Quarter_Circle(int x, int y, float radius, int secondX, int secondY){
    super(x,y);
    this.radius = radius;
    this.secondX = secondX;
    this.secondY = secondY;
    angle = atan((secondY - y)/(secondX - x + 0.000001));
  }
  float calculateArea(){
    return radius * radius * QUARTER_PI;
  }
  void display(){
    stroke(255, 0, 0);
    if (secondX - x < 0) arc(x, y, radius, radius, angle - QUARTER_PI + PI, angle + QUARTER_PI + PI);
    else arc(x, y, radius, radius, angle - QUARTER_PI, angle + QUARTER_PI);
  }
  float calculateCenterX(){
    return 4 * radius / 3 / PI * sqrt(2) * cos(angle);
  }
  float calculateCenterY(){
    return 4 * radius / 3 / PI * sqrt(2) * sin(angle);
  }
}
