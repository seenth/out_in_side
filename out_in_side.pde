import processing.video.*;
Capture video;

int x = 0;
int y = 0;

void setup() {
  fullScreen();
  background(0);
  String[] cameras = Capture.list();
  printArray(cameras);
  //this, w, h, fps
  video = new Capture(this, cameras[0]);
  video.start();
}

void captureEvent(Capture video) {
  //continuosly read from camera
  //place in draw's if statement for slower speed, but higher quality
  video.read();
}

void draw() {
  //place in if statement for slower speed, but higher quality
  //video.loadPixels();
  //image(video,0,0);
  
  
  //change if statement to video.available() for slower speed, but higher quality
  if (video.height > 0) {
 //copy(src, src x, src y, src w, src h, dest x, dest y, dest w, dest h)
  copy(video, video.width/2, 0, 50, video.height, (x++%width), 88, 50, video.height); //horizontal
  
  //x = x + 1;
  if (x > width) {
    x = 0;
  saveFrame("line-######.png");
  }
  

}
}