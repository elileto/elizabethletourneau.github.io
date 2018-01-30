 //<>//
//Array that stores the X and Y position of the three buttons 
final int numRect = 3;
int[] rectX = new int[numRect];
float[] rectY = new float[numRect];

//array that stores a list of colors the buttons change to
color[] rectColor = {
  color(227, 41, 41), //red
  color(255, 163, 102), //orange
  color(250, 250, 0), //yellow
  color(0, 255, 0), //green
  color(102, 255, 255), //light blue
  color(0, 0, 255), //blue
/*  color(204, 102, 255), //purple
 color(255, 102, 140), //pink
 color(0, 0, 153), //dark blue
 color(0, 255, 204), // light green
 */
};
//stores the length of the color index array
int numColor = rectColor.length;
//an array that stores the index number of whatever color is being called in each
//button
int [] rectColorIndex = new int[numColor];
int[] speed = new int[numRect];

int index;
//variable that stores the current X and Y position;
int initialY; 
int initialX; 
int initialColor;

int wait = 0; 
float score;

void setup()
{
  size(500, 500);


  int rectNum = 0;
  rectMode(CENTER);
  smooth();
  //while the counter is less then the number of rectangle (3)
  while (rectNum < numRect)
  { 
    int spacer = 30;
    int rectWidth = 80;
    //set the initial height to the middle
    initialY = height/2-100;
    //set the initial X position to what ever number were on time the width and spacer
    initialX = (width/5+15) + ((rectNum +1) *spacer + (rectNum) * rectWidth);
    //set the rectSpeed index to a random number beteen the length of the color index
    initialColor = (int)random(0, 6);
    speed[0] = 10;
    speed[1] = 13;
    speed[2] = 16;

    rectColorIndex[rectNum] = initialColor;
    //set the rectX and rectY array up with the initial X and Y postion
    rectX[rectNum] = initialX;
    rectY[rectNum] = initialY;
    rectNum++;
  }
}

void draw()
{

  background(0);
  //i need this function to print out three buttons, that each loops through colors at 
  //different speeds
  //set the rectangle counter to zero
  int rectNum = 0;
  int rectWidth = 80;
  int rectHeight = 100;
  frameRate(60);
  while (rectNum < numRect) {
    if (frameCount % speed[rectNum]  == 0 ) {
      if (rectColorIndex[rectNum] >= rectColor.length -1) {
        rectColorIndex[rectNum] = 0;
      } else { 
        rectColorIndex[rectNum]++;
      }
    }
    fill(rectColor[rectColorIndex[rectNum]]);
    rect(rectX[rectNum], rectY[rectNum], rectWidth, rectHeight);
    rectNum++;
  }

  drawRect();
  drawScore();
}

void drawRect() {

  fill(255);
  rect(width/2, height*3/4, 150, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text("PLAY", width/2, height*3/4);
}

void drawScore() {
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Cost  $" + score, width/2, height - 50);
}
void mouseClicked () {
  if (mouseX > width/2 - 75 && mouseX < width/2 +75
    && mouseY > height*3/4 -25 && mouseY < height*3/4 +25) {
    if (looping)  
    {
      noLoop();
      fill(0);
      rect(width/2, height -50, 225, 100);
      score += 0.25;
      drawScore();

      if ( rectColorIndex[0] == rectColorIndex[1] && 
        rectColorIndex[1] == rectColorIndex[2] ) {
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(64);
        text( "YOU WIN", width/2, height/2);
        score = 0;
      } else {
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(64);
        text( "YOU LOST", width/2, height/2);
      }
    } else {

      loop();
    }
  }
}      