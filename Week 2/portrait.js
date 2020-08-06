void setup(){
size (500,500); //this is the size of the canvas
background (0); //this chooses our background colour
}

void draw(){//portrait
  ellipse (250,250,160,220);
  fill (0);
  ellipse (220,220,30,40);
  fill(0);
  ellipse (280,220,30,40);
  fill(255);
  ellipse (220,220,10,10);//eyeball
  fill(255);
  ellipse (280,220,10,10);//eyeball
  fill(255,204,204);
  ellipse (250,300,60,30);//mouth
  fill(255,255,255);
  ellipse (170,265,30,40);//ear
  fill(255,255,255);
  ellipse (330,265,30,40);//ear
   

stroke(255); //this choose black as the outline
line (mouseX, mouseY, 250, 250); 
fill (255,255,255);
noStroke(); //turns stroke off
}

void keyPressed(){
background (mouseY/2, (mouseY+mouseX)/4,250-mouseX/2);
}
