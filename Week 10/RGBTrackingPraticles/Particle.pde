// A simple Particle class
/*
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
*/
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan = 255;
  
Particle() {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = new PVector(mouseX, mouseY);
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
    // Method to display
  void display() {
    stroke(lifespan);
    
    //strokeWeight(2);
    noStroke();
    float r = random(0,255);
    float g = random(0,255);
    float b = random(0,255);
    // random the circle's color
    fill(r,g,b, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
}
