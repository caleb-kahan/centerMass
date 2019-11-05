class CircSegment extends Shape{
  float radius;
  int firstX;
  int firstY;
  int secondX;
  int secondY;
  float angle;
  
  CircSegment(float x, float y, float radius, int firstX, int firstY, int secondX, int secondY){
    super(x,y);
    this.radius = radius;
    this.secondX = secondX;
    this.secondY = secondY;
    this.firstX = firstX;
    this.firstY = firstY;
    angle = atan((secondY - y)/(secondX - x + 0.000001));
  }
  float calculateArea(){
    return radius * radius * QUARTER_PI - (abs(x * (secondY - firstY) + secondX * (firstY - y) + firstX * (y - secondY)) /2); // quarter circle - inscribed triangle
  }
  void display(){
    if (secondX - x < 0) arc(x, y, 2 * radius, 2 * radius, atan((secondY - y)/(secondX - x )) + PI, atan((secondY - y)/(secondX - x)) + PI + HALF_PI, CHORD);
    else arc(x, y, 2 * radius, 2 * radius, atan((secondY - y)/(secondX - x)), atan((secondY - y)/(secondX - x )) + HALF_PI, CHORD);
  }
  float calculateCenterX(){
    float comQC = 4 * radius / 3 / PI * sqrt(2) * cos(angle);
    float comT = (x + firstX + secondX)/3.;
    return (comQC * radius * radius * QUARTER_PI - comT * abs(x * (firstY - secondY) + firstX * (secondY - y) + secondX * (y - firstY)) /2) / (comQC + comT);
  }
  float calculateCenterY(){
    float comQC = 4 * radius / 3 / PI * sqrt(2) * sin(angle);
    float comT = (y + firstY + secondY)/3.;
    return (comQC * radius * radius * QUARTER_PI - comT * abs(y * (firstX - secondX) + firstY * (secondX - x) + secondY * (x - firstX)) /2) / (comQC + comT);
  }
}
