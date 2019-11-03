class Rectangle extends Shape{
  float w;
  float h;
  
  Rectangle(int x, int y, int w, int h){
    super(x,y);
    this.w = w;
    this.h = h;
  }
  float calculateArea(){
    return w * h;
  }
  void display(){
    rect(x, y, w, h);
  }
}
