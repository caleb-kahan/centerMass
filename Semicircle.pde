class Semicircle extends Shape{
  float radius;
  int secondX;
  int secondY;
  float angle;
  
  Semicircle(float x, float y, float radius, int secondX, int secondY){
    super(x,y);
    this.radius = radius;
    this.secondX = secondX;
    this.secondY = secondY;
    angle = atan((secondY - y)/(secondX - x + 0.000001));
  }
  float calculateArea(){
    return radius * radius * HALF_PI;
  }
  void display(){
    stroke(255, 0, 0);
    if (secondX - x < 0) arc(x, y, 2*radius, 2*radius, angle - HALF_PI + PI, angle + HALF_PI + PI);
    else arc(x, y, 2*radius, 2*radius, angle - HALF_PI, angle + HALF_PI);
  }
  float calculateCenterX(){
    return 4 * radius / 3 / PI * cos(angle);
  }
  float calculateCenterY(){
    return 4 * radius / 3 / PI * sin(angle);
  }
}
