class Ellipse extends Shape{
  float w;
  float h;
  
  Ellipse(int x, int y, int w, int h){
    super(x,y);
    this.w = w;
    this.h = h;
  }
  float calculateArea(){
    return w * h * PI;
  }
  void display(){
    ellipse(x, y, w*2, h*2);
  }
}