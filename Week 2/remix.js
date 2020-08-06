void setup(){
background(247,198,59);
size (500, 500);
}

void draw(){
if (mousePressed){
fill (247,198,59);
noStroke();
ellipse (mouseX, mouseY, 30, 30);
}
else {
fill(0);
noStroke();
ellipse (mouseX, mouseY, 30, 30);
}

fill(230,200,180);
//the face follows from here
translate(250,250); 
//face
ellipse (0, 0, 150,200); 

//mouth
fill(mouseX/2, mouseY/2, (mouseX + mouseY)/4);
ellipse (0, 40, 70,30); 
noStroke();

//eyes
fill(255);
ellipse (30, -40, 40,40);
ellipse (-30, -40, 40,40);
fill (0);
ellipse (0-mouseX/20, -40, 15,15);
ellipse (mouseX/20, -40, 15,15);
}
