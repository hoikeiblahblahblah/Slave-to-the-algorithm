function Particle(x, y, vx, vy) {
  
  this.pos = new p5.Vector(x, y);
  this.vel = new p5.Vector(vx, vy);
  this.vel.mult(random(10));
  this.vel.rotate(radians(random(-25, 25)));
  this.mass = random(1, 30);
  this.airDrag = random(0.92, 0.98);
  this.colorIndex = int(random(colorScheme.length));
  this.life = 0;
  this.lifeSteps = random(-1, 1);
  
  this.move = function() {
    this.pos.rotate(radians(this.life * 0.002));
    this.vel.mult(this.airDrag);
    this.pos.add(this.vel);
    this.life += this.lifeSteps;
  }
}
