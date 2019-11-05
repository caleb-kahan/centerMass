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
    if (secondX - x < 0) angle = atan((secondY - y)/(secondX - x + 0.000001)) + PI;
    else angle = atan((secondY - y)/(secondX - x + 0.000001));
    this.comX = calculateCenterX();
    this.comY = calculateCenterY();
    this.area = calculateArea();
  }
  float calculateArea(){
    return radius * radius * QUARTER_PI - (abs(x * (secondY - firstY) + secondX * (firstY - y) + firstX * (y - secondY)) /2); // quarter circle - inscribed triangle
  }
  void display(){
    arc(x, y, 2 * radius, 2 * radius, angle, angle + HALF_PI, CHORD);
    super.display();
  }
  float calculateCenterX(){
    float areaQC = radius * radius * QUARTER_PI;
    float areaT = - abs(x * (firstY - secondY) + firstX * (secondY - y) + secondX * (y - firstY)) /2;
    return ((4 * radius / 3 / PI * sqrt(2) * cos(angle + QUARTER_PI) + x) * areaQC + (x + firstX + secondX)/3. * areaT) / (areaQC + areaT);
  }
  float calculateCenterY(){
    float areaQC = radius * radius * QUARTER_PI;
    float areaT = - abs(x * (firstY - secondY) + firstX * (secondY - y) + secondX * (y - firstY)) /2;
    return ((4 * radius / 3 / PI * sqrt(2) * sin(angle + QUARTER_PI) + y) * areaQC + (y + firstY + secondY)/3. * areaT) / (areaQC + areaT);
  }
}
