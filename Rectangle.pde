class Rectangle extends Shape{
  float w;
  float h;
  
  Rectangle(float x, float y, int w, int h){
    super(x,y);
    this.w = w;
    this.h = h;
  }
  float calculateArea(){
    return w * h;
  }
  void display(){
    stroke(255, 0, 0);
    rect(x, y, w, h);
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
