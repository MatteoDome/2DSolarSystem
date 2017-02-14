class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  Planet[] planets;
  
  Planet(float r, float d, float o) {
    radius = r;
    distance = d;
    orbitSpeed = o;
    angle = random(-2*PI, 2*PI);
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnSatellites(int total,int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      planets[i] = new Planet(random(0.5*radius, 0.7*radius)/level, random(radius/level +radius, 2*(radius/level +radius)), random(-.003, .003));
      if (level < 2){
        planets[i].spawnSatellites(int(random(0, 4)), level+1);
      }  
    }
  }
  
  void show() {
    pushMatrix();
    fill(255);
    rotate(angle);
    translate(distance, 0);
    ellipse(0, 0, radius*2, radius*2);
    if (planets != null){  
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
  
}