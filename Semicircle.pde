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
    if (secondX - x < 0) angle = atan((secondY - y)/(secondX - x + 0.000001)) + PI;
    else angle = atan((secondY - y)/(secondX - x + 0.000001));
    this.comX = calculateCenterX();
    this.comY = calculateCenterY();
    this.area = calculateArea();
  }
  float calculateArea(){
    return radius * radius * HALF_PI;
  }
  void display(){
    stroke(255, 0, 0);
    arc(x, y, 2*radius, 2*radius, angle - HALF_PI, angle + HALF_PI);
    super.display();
  }
  float calculateCenterX(){
    return 4 * radius / 3 / PI * cos(angle) + x;
  }
  float calculateCenterY(){
    return 4 * radius / 3 / PI * sin(angle) + y;
  }
}
