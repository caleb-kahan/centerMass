abstract class Shape{
  float x;
  float y;
  float area; 
  
  Shape(float x,float y){
    this.x = x;
    this.y = y;
    this.area = calculateArea();
  }
  abstract void display();
  abstract float calculateArea();
  abstract float calculateCenterX();
  abstract float calculateCenterY();
}
