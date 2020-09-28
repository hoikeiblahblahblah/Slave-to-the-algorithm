/*Particle system 
Inspired by Jason Labbe and takawo's sketch:
  https://www.openprocessing.org/sketch/853212
*/


const MAX_TRAIL_COUNT = 30;

var colorScheme = ["#66ff33", "#ff66ff", "#0099ff", "#ff6666", "#ff9933"]; //["#0A1B28", "#071F43", "#357D7E", "#35EEEE", "#919DF0"];
var trail = [];
var particles = [];

function setup() {
  let canvas = createCanvas(windowWidth, windowHeight);
  canvas.canvas.oncontextmenu = () => false;  // Removes right-click menu.
  //noCursor();
}

function draw() {
  blendMode(BLEND);
  background(0);
  blendMode(SCREEN);
  
  // Trim end of trail.
  trail.push([mouseX, mouseY]);
  
  let removeCount = 10;
  if (mouseIsPressed && mouseButton == CENTER) {
    removeCount++;
  }
  
  for (let i = 0; i < removeCount; i++) {
    if (trail.length == 0) {
      break;
    }
    
    if (mouseIsPressed || trail.length > MAX_TRAIL_COUNT) {
      trail.splice(0, 1);
    }
  }
  
  // Spawn particles.
  if (trail.length > 1) {
    let mouse = new p5.Vector(mouseX, mouseY);
    mouse.sub(pmouseX, pmouseY);
    if (mouse.mag() > 5) {
      mouse.normalize();
      for (let i = 0; i < 3; i++) {
        particles.push(new Particle(pmouseX, pmouseY, mouse.x, mouse.y));
      }
    }
  }
  
  // Move and kill particles.
  for (let i = particles.length - 1; i > -1; i--) {
    particles[i].move();
    if (particles[i].vel.mag() < 0.1) {
      particles.splice(i, 1);
    }
  }
  
  // Draw trail.
  drawingContext.shadowColor = color(226, 213, 151);

  for (let i = 0; i < trail.length; i++) {
    let mass = i * 1.5;
    drawingContext.shadowBlur = 100;

    stroke(0);
    strokeWeight(mass);
    point(trail[i][0], trail[i][1]);
  }
  
  // Draw particles.
  for (let i = 0; i < particles.length; i++) {
    let p = particles[i];
    let mass = p.mass * p.vel.mag() * 0.6;

    drawingContext.shadowColor = color(colorScheme[p.colorIndex]);
    drawingContext.shadowBlur = mass;

    stroke(0);
    strokeWeight(mass);
    point(p.pos.x, p.pos.y);

    stroke(255);
    strokeWeight(mass * 0.05);
    point(p.pos.x, p.pos.y);
  }
}
