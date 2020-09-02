We’ve started today’s session with coding integrating texts, images and interactive elements in processing. We had experimented sketch by importing a webcam to the processing canvas and it was fun, and we can even choose different typefaces of display texts. 

# Spinning fonts 

```javascript
PFont helvNeue,bookMan, helv;
float spin=0;

void setup(){
  size(500,500);
  background(255); 
  fill(0);
  smooth(4);
  //helv = createFont("Helvetica", 32, true);
  helvNeue=loadFont("HelveticaNeueLTStd-HvCnO-48.vlw");
  //bookMan=loadFont("BookmanOldStyle-Bold-24.vlw");
  
  textAlign(CENTER,CENTER);//horozontal align, vertival align
  
  frameRate(30);//sets the animation speed (frames per second)
}

void draw(){
  fill(0,255,0);
  translate(width/2,height/2);
  spin+=.1; //increments the rotation value
  
  rotate(spin);
  
  textFont(helvNeue);
  textSize(48);
  text("this is hoikei chan", 0, 0);
  
  fill(255,20);
  noStroke();
  rect(-width/2,-height/2,width,height);//
  //textSize(18);
  //textFont(bookMan);
  //text("Bookmanoldstyle 24pt", width/2, height/3);
}

void keyPressed(){
  background(255); //clears the background
}
```

<img src="images/fonts.png" width="500">

# Draw with texts

```javascript
PFont myfont; //initiating 
int randchar,randSize; //initiating our variables
char letter;
color randColorR,randColorG,randColorB;
void setup(){
  size (500,500);
  background(200);
  myfont = loadFont("CenturySchoolbook-24.vlw");//font needs to be in your data folder(use the "create font")
  
}

void draw(){
  fill(0);
  textFont(myfont);
  randchar=int(random(120)+1);//this will pluck a random character out of our 'type'
  randSize=int(random(60)+1);
  letter=char(randchar);
  textSize(int(randSize)+1);
  
  if (mousePressed){
    text(letter,mouseX,mouseY);    
  }
}

void keyPressed(){
  randColorR=int(map(mouseX,0,width,0,255));
  randColorG=int(map(mouseY,0,height,0,255));
  randColorB=int(map(mouseX+mouseY,0,width+height,0,255));
 background(randColorR,randColorG,randColorB); 
}
```

<img src="images/drawwithtext.png" width="500">

# import photo

```javascript
PImage photo; //there will be a varaiable that we call it photo 
int smallPoint, largePoint, x, y, dotSize, t; //int means numbers
color pix;
float pointillise;

void setup(){
  size(768,768);
  background (255);
  imageMode(CENTER); //imagemode specific to photo function, default is top left 
  photo = loadImage("teamlab.jpg"); //variable name must be the same as the PImage
  smallPoint = 4;
  largePoint = 90;
}

void draw(){
//image (photo,384,384); //coordinates at the back is located at the center, this loads the image to fil the sketch

x=int (random(photo.width)); //finds the random point across the sketch (x)
y=int(random(photo.height));

pointillise = map(mouseX, 0, photo.width, smallPoint, largePoint);//map(input, lowest value in, highest value in, lowest value out, highest value out)
dotSize = int(pointillise);

pix=photo.get(x,y); //gets the color value from the random point on the image 
t=int(random(256));//transparency of the circle 

fill (pix,t); //updates the color of the fill() to the pixel values as set by color
//strokeWeight(3);
//stroke (pix,t);
noStroke(); //removes the outline of the circle 
//ellipse(384,384,50,50); //(circle location,circle size) 
ellipse(x, y, dotSize,dotSize); //this draws the circle with the color values
//line(x,y,x+dotSize, y+dotSize); //this draws the lines 
}
```

<img src="images/photo.png" width="500">

