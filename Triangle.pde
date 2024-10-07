class Triangle extends Shape {
  Triangle(boolean isGood, float x, float y, float size, float speed, color fillColor) {
    super(isGood, 1, x, y, size, speed, fillColor);
  }
  
  void draw() {
    fill (fillColor);
    noStroke();
    triangle(x - size/2,y+size/2,x+size/2,y+size/2,x,y-size/2);
  }
}
