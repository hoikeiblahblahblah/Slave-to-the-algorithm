class Particle {
  PVector pos;
  PVector vel;
  float mass;
  float airDrag;
  int colorIndex;
  int life;
  float lifeSteps;
  
  Particle(float x, float y, float vx, float vy) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    vel.mult(random(7));//10
    vel.rotate(radians(random(-25, 25)));
    mass = random(1, 25);//(15,15)
    airDrag = random(0.92, 0.98);
    colorIndex = int(random(5));
    life = 0;
    lifeSteps = random(-1, 1);
  }

  void move() {
    pos.rotate(radians( life * 0.002));
    vel.mult( airDrag);
    pos.add( vel);
    life +=  lifeSteps;
  }
}
