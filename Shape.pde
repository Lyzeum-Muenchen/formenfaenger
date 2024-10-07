abstract class Shape {
  
  int points; // Punkte für das Fangen der Form
  boolean isGood; // Falls die Form "gut" ist, bekommt man Punkte für das Fangen, sonst verliert man Leben
  float x;
  float y;
  float size;
  float speed;
  color farbe;
  color fillColor;
  
  Shape(boolean isGood, int points, float x, float y, float size, float speed, color fillColor) {
    this.isGood = isGood;
    this.points = points;
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
    this.fillColor = fillColor;
  }
  
  // returns: true falls Form entfernt werden soll
  boolean move () {
    y += speed;
    
    // TODO: form fangen
    
    return y - size/2 >= height;
  }
  
  void formFangen() {
    if (isGood) score += points;
    else lives --;
  }
  
  abstract void draw();
  
}
