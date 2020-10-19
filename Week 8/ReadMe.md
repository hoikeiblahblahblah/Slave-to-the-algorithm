**Work In Progress**<br/>
After I exposed myself to p5js, I found that p5js supports more libraries(or easier to approach) in generative design such as motion tracking and p5 sound library. The most interesting one I found is matter.js —  a 2D rigid body physics engine for the web. During the week, I have successfully collect depth data through the kinetic sensor, but unfortunately it was code in Java, which has more 

In order to achieve the best outcome, I decided to use kinetic sensor instead of web cam. And I’ve done some research before I start, these are the codes from Danial Shiffman. He introduced a Kinect library for processing and by following these steps, I am able to connect the kinetic sensor to my laptop successfully. 

Instead of using the total pixels of the entire image, I calculated the average pixels of the depth data. So that I can find the centre of the moving object and make sure the artworks generated are able to follow the object movements correspondingly. The code works well when there’s only one object detected. <br/>
<img src = "images/soundtest.gif">

However, if there’s more than one object detected, the circle will be wiggling and jumping around the canvas. Because I am only tracking the average points of every pixels collected, so if there’s more than one object detected, the circle will appear somewhere between different objects. <br/>
<img src = "images/soundtest.gif">

Besides that, the depth image I’m getting from kinetic v2 sensor has a width of 512 and height of 424, which I didn’t expect the resolution to be this low. <br/>
<img src = "images/soundtest.gif">
