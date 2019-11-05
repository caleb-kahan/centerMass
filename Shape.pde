abstract class Shape{
  float x;
  float y;
  float area;
  float comX;
  float comY;
  
  Shape(float x,float y){
    this.x = x;
    this.y = y;
    this.comX = calculateCenterX();
    this.comY = calculateCenterY();
    this.area = calculateArea();
  }
  void display(){
    stroke(255, 0, 0);
    ellipse(comX, comY, 2, 2);
  }
  abstract float calculateArea();
  abstract float calculateCenterX();
  abstract float calculateCenterY();
}
