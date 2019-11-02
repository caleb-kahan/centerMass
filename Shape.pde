abstract class Shape{
  int x;
  int y;
  float area; 
  
  Shape(int x,int y){
    this.x = x;
    this.y = y;
    this.area = calculateArea();
  }
  abstract float calculateArea();
}
