final int MAX_LIVES = 3;
int score = 0;
int lives = MAX_LIVES;
ArrayList<Shape> shapes = new ArrayList();
boolean playing = true;

void setup() {
  size(600, 600);
}

void draw() {
  // Zeichnen

  background(255);

  // Spieler
  fill(0);
  noStroke();
  rect(mouseX - 30, height - 5, 60, 5);

  // Anzeige
  textAlign(RIGHT, TOP);
  textSize(32);
  text("Score: " + score, width, 0);
  textAlign(LEFT, TOP);
  text(lives + "/" + MAX_LIVES + " Lives", 0, 0);

  // Formen
  for (Shape shape : shapes) {
    shape.draw();
  }

  // Logik

  if (playing) {
    ArrayList<Shape> deadShapes = new ArrayList();
    for (Shape shape : shapes) {
      boolean remove = shape.move();
      if (remove) deadShapes.add(shape);
    }
    shapes.removeAll(deadShapes);

    // Generieren
    if (random(1) < 0.02) {
      shapes.add(makeShape(random(1) < 0.8));
    }

    if (lives <= 0)
      playing = false;
  } else {
    textAlign(CENTER, CENTER);
    fill (0);
    textSize(32);
    text("Press any key to restart", width/2, height/2);
  }
}

Shape makeShape(boolean isGood) {
  float x = random(width);
  float y = -20;
  float size = 20;
  float speed = 2;
  color fillColor;
  int type = int(random(2));

  if (isGood) {
    fillColor = color(0, 255, 0);
  } else {
    fillColor = color(255, 0, 0);
  }

  switch(type) {
  case 0:
    return new Rectangle(isGood, x, y, size, speed, fillColor);
  case 1:
    return new Triangle(isGood, x, y, size, speed, fillColor);
  default:
    return null;
  }
}

void keyPressed() {
  if (! playing) {
    playing = true;
    score = 0;
    lives = MAX_LIVES;
    shapes = new ArrayList();
  }
}
