class Ellipse extends Shape{
  float w;
  float h;
  
  Ellipse(float x, float y, int w, int h){
    super(x,y);
    this.w = w;
    this.h = h;
  }
  float calculateArea(){
    return w/2 * h/2 * PI;
  }
  void display(){
    stroke(255, 0, 0);
    ellipse(x, y, w, h);
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
