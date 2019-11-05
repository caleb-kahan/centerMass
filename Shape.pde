abstract class Shape{
  int x;
  int y;
  float area; 
  
  Shape(int x,int y){
    this.x = x;
    this.y = y;
    this.area = calculateArea();
  }
  abstract void display();
  abstract float calculateArea();
  //abstract float calculateCenterX();
  //abstract float calculateCenterY();
}
