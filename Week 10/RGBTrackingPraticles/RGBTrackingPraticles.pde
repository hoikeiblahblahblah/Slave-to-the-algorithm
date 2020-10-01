//reference from danial shiffman's processing kinetic sensor and particle system 
//import org.openkinect.freenect.*;
//import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
//import org.openkinect.tests.*;
ParticleSystem ps;

Kinect2 kinect2;

float minThresh = 200; //200
float maxThresh = 1000; //1500

PImage img;

void setup() {
  size (1024, 848);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);


  //ps = new ParticleSystem(new PVector(width/2, 50));
  ps = new ParticleSystem();
}

void draw() {
  background(0);

  img.loadPixels(); //set pixels on image on the raw depth 

  //minThresh = map(mouseX, 0, width,0,4500);
  //maxThresh = map(mouseY, 0, height,0,4500);

  //get the raw depth as array of integers
  int [] depth = kinect2.getRawDepth();

  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0; //total number of pixels 

  for (int x = 0; x < kinect2.depthWidth; x++) { //looking at every single pixel, finding its index into the depth
    for (int y = 0; y < kinect2.depthHeight; y++) { 
      int offset = x + y * kinect2.depthWidth;
      int d = depth[offset]; 

      if (d > minThresh && d < maxThresh && x >100) {

        img.pixels[offset] = color(0, 255, 0); // fill colors for every x and y values/pixels

        sumX += x;
        sumY += y;
        totalPixels++; //for every pixels, add 1
      } else {
        img.pixels[offset] = color(0);
      }
      
    }
  }
    
  
  
  img.updatePixels();
  image (img, 0, 0);

  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  fill(250, 0, 150);
  ellipse(avgX, avgY, 30, 30);
  for (int i = 0; i < 1; i++) {
  ps.addParticle();
  }
  ps.run();

  fill(255);
  textSize(32);
  //text(minThresh + ""+ maxThresh, 10, 64); //print thresh values
  text(avgX + ""+ avgY, 50, 50);

}
