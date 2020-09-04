**Paper prototype**<br/>
During the short workshop Andy host, we were divided into different groups to make a quick paper prototype of a 2D game, this activity helps us to better understand the algorithm and quickly generate concept. We were given 10 minutes and choose the game — Super Mario. 

**Coding workshop | p5js sound features**<br/>
``` javascript
var song; //give a name to song variable
var analyzer;
function preload(){
  song = loadSound('data/Super_Mario_Bros.mp3');//link the sound file to our song variable
}

function setup() {
createCanvas(windowWidth,windowHeight);//create full window canvas 
background(0);//background of canvas
fill(255,0,0);//starting color of our objects 
//set analyzer to check amplitude
analyzer = new p5.Amplitude();
analyzer.setInput(song);
stroke(255);
}

function draw() {
  background (0);
  var volume = analyzer.getLevel();//this will extract the volume of the song 
  volume = (volume*windowWidth) + 60;
  ellipse(windowWidth/2,windowHeight/2,volume,volume);//object drawn to screen

}

function mousePressed(){//triggers on mousepress
 if (song.isPlaying()){//checks if the song is playing
 fill(0,0,255);
 song.stop();//if it is, then stop the song
 song.noLoop();
 }
 else{
  fill(0,255,0);//if it isnt then play the song
  song.play();//change to red
  song.loop();
} 
}
```
<img src = "images/soundtest.gif">
