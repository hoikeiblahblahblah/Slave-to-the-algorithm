/* Utopia 
Reference from danial shiffman's processing kinetic sensor and particle system 

illumination Effect reference from Thomas Diewald -- bloomDebug

Graphic inspired by Jason Labbe https://www.openprocessing.org/sketch/854150
*/

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.core.PApplet;
import processing.opengl.PGraphics2D;
import org.openkinect.processing.*;

Kinect2 kinect2;
DwPixelFlow context;
DwFilter filter;
PGraphics2D bubble;

int MAX_TRAIL_COUNT = 30;
color []colorScheme;
ArrayList<Particle> particles;

float minThresh = 200; //200
float maxThresh = 1000; //1500
float sumX = 0;
float sumY = 0;
float totalPixels = 0;
float avgX;
float avgY;

PImage img; 


void setup() {
  fullScreen(P2D, 2);
  //size(1790, 1050, P2D);
  kinect2 = new Kinect2(this);

  //initiae depth imag and device 
  kinect2.initDepth(); 
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);

  //Particle
  particles = new ArrayList<Particle>();
  colorScheme = new color[5];
  colorScheme[0]=#F21818;
  colorScheme[1]=#071F43;
  colorScheme[2]=#357D7E;
  colorScheme[3]=#F2E818;
  colorScheme[4]=#919DF0;

  context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  filter = new DwFilter(context);

  bubble = (PGraphics2D) createGraphics(width, height, P2D);
  bubble.smooth(8);
}

void draw() {

  background(0);
  //set pixels on image on the raw depth
  img.loadPixels(); 

  //get the raw depth as array of integers
  int [] depth = kinect2.getRawDepth();


  sumX = 0;
  sumY = 0;
  totalPixels = 0; //total number of pixels 

  for (int x = 0; x < kinect2.depthWidth; x++) { //looking at every single pixel, finding its index into the depth
    for (int y = 0; y < kinect2.depthHeight; y++) { 
      int offset = x + y * kinect2.depthWidth;
      int d = depth[offset]; 

      if (d > minThresh && d < maxThresh && x >100) {

        //fill colors for every x and y values/pixels
        img.pixels[offset] = color(0, 255, 0); 

        //adds up all the x and y 
        sumX += x;
        sumY += y;
        //for every pixels, add 1
        totalPixels++; 
      } else {
        img.pixels[offset] = color(0);
      }
    }
  }


  avgX = sumX / totalPixels;
  avgY = sumY / totalPixels;

  img.updatePixels();
  
  //kinect image
  scale(2.5);
  image (img, 0,0); 

  //particles 
  PVector position = new PVector(avgX, avgY);
  position.sub(avgX/2, avgY/2);
  if (position.mag() > 5) {//5
    position.normalize();
    for (int i = 0; i < 3; i++) {//i<3
      particles.add(new Particle(avgX/2, avgY/2, position.x, position.y));
    }
  }

  // Move and kill particles.
  for (int i = particles.size() - 1; i > -1; i--) {
    Particle p = particles.get(i);
    p.move();
    if (p.vel.mag() < 0.1) {
      particles.remove(i);
    }
  }

  bubble.beginDraw();
  bubble.background(0);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    float mass = p.mass * p.vel.mag() * 0.4;//0.6 particle size 

    bubble.stroke(colorScheme[p.colorIndex]);
    bubble.strokeWeight(mass);
    bubble.point(p.pos.x, p.pos.y);

    bubble.stroke(colorScheme[p.colorIndex]);
    bubble.strokeWeight(mass * 0.1);//0.5
    bubble.point(p.pos.x, p.pos.y);
  }
  bubble.endDraw();

  DwFilter filter = DwFilter.get(context);
  filter.bloom.param.mult   = 3;//6
  filter.bloom.param.radius = 0.3;
  filter.luminance_threshold.param.threshold = 0.6f;
  filter.luminance_threshold.param.exponent = 5;
  filter.bloom.apply(bubble, bubble, null);

  scale(2.45);
  image(bubble, 100, 0);
}
