class Rectangle extends Shape {
  Rectangle(boolean isGood, float x, float y, float size, float speed, color fillColor) {
    super(isGood, 1, x, y, size, speed, fillColor);
  }
  
  void draw() {
    fill (fillColor);
    noStroke();
    rect(x - size/2, y - size/2, size, size);
  }
}
