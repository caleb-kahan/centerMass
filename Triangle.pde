class Triangle extends Shape{
  float x1;
  float y1;
  float x2;
  float y2;
  
  Triangle(int x, int y, float x1, float y1, float x2, float y2){
    super(x,y);
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  float calculateArea(){
    return abs(x * (y1 - y2) + x1* (y2 - y) + x2 * (y - y1)) /2;
  }
  void display(){
    line(x, y, x1, x1);
    line(x2, y2, x1, y1);
    line(x, y, x2, y2);
  }
}
