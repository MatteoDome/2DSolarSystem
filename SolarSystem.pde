Planet sun;

void setup() {
  size(800, 800);
  sun = new Planet(50, 0, 0);
  sun.spawnSatellites(5, 1);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
}