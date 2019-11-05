class CircSegment extends Shape{
  float radius;
  int firstX;
  int firstY;
  int secondX;
  int secondY;
  
  CircSegment(int x, int y, float radius, int firstX, int firstY, int secondX, int secondY){
    super(x,y);
    this.radius = radius;
    this.secondX = secondX;
    this.secondY = secondY;
    this.firstX = firstX;
    this.firstY = firstY;
  }
  float calculateArea(){
    return radius * radius * QUARTER_PI - (abs(x * (secondY - firstY) + secondX * (firstY - y) + firstX * (y - secondY)) /2); // quarter circle - inscribed triangle
  }
  void display(){
    float xc = (firstX + mouseY - firstY + mouseX)/2;
    float yc = (firstX + mouseY + firstY - mouseX)/2;
    if (mouseX - firstX < 0) arc(xc, yc, 2 * radius, 2 * radius, atan((mouseY - yc)/(mouseX - xc + 0.000001)) + PI, atan((mouseY - yc)/(mouseX - xc + 0.000001)) + PI + HALF_PI, CHORD);
    else arc(xc, yc, 2 * radius, 2 * radius, atan((mouseY - yc)/(mouseX - xc + 0.000001)), atan((mouseY - yc)/(mouseX - xc + 0.000001)) + HALF_PI, CHORD);
  }
  float calculateCenterX(){
    return 0.;
  }
  float calculateCenterY(){
    return 0.;
  }
}
