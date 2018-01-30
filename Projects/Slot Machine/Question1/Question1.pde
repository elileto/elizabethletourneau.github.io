//variable for button layout //<>// //<>// //<>// //<>//
final float spacer = 9;
final float buttonWidth = 40;
final float buttonHeight = 50;

//array of colors to go through
color [] fillColor = 
  { color(227, 41, 41), //red
  color(255, 163, 102), //orange
  color(250, 250, 0), //yellow
  color(0, 255, 0), //green
  color(0, 0, 255), 
  color(227, 41, 41), //red
  color(255, 163, 102), //orange
  color(250, 250, 0), //yellow
  color(0, 255, 0), //green
  color(0, 0, 255) //blue
};

//array for number of buttons to be printed
final int numButtons = 10;
int [] buttonArray = new int[numButtons];


void setup() {
  size(500, 500);
  background(100);
 //parrallel array setup to index button number for each color 
  int colorNum = 0;
  while ( colorNum < numButtons) {
    buttonArray[colorNum] = (int)random(0, 5);
    colorNum++; //<>//
  }
  noStroke();
}


void draw() {

  int colorNum =0;
  while ( colorNum< numButtons) {

    float buttonX = (colorNum+1)*spacer + (colorNum)*buttonWidth;

    fill(fillColor[buttonArray[colorNum]]);
    if (colorNum > fillColor.length) {
      colorNum = 0;
    }
    rect(buttonX, height/4, buttonWidth, buttonHeight);  


    colorNum++;
  }
}

void mouseClicked() {

  int colorNum =0;
  while ( colorNum< numButtons){
  float buttonX = (colorNum+1)*spacer + (colorNum)*buttonWidth;

  if ((mouseX >= buttonX && mouseX <= buttonX + buttonWidth)
    && (mouseY >= height/4  && mouseY <= height/4 + buttonHeight))
  {
    if (buttonArray[colorNum] >= 4) {
      buttonArray[colorNum] = 0;
    } else {
      buttonArray[colorNum]++;
    }
  } colorNum++; //<>//
  }
}