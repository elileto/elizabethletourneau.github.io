//variable for button layout //<>// //<>//
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

};

//array for number of buttons to be printed
final int numButtons = 10;
int [] buttonArray = new int[numButtons];

int colorNum; //max 5
int buttonNum; // max 10

void setup() {
  size(500, 500);
  background(100);
  //parrallel array setup to index button number for each color 

  int buttonNum = 0;
  //while button number is less then number of buttons
  while ( buttonNum < numButtons) {
    //i need my button array to be associated with a random number between 0 -4
    buttonArray[buttonNum] = (int) random(0, 5);
    buttonNum++;
  }
  noStroke();
}

void draw() {
  //I need to draw ten buttons, I need these ten buttons to associate with 1 of 5 colors
  //called from my buttonArray[ buttonNum]

  // while the button number is less then number of buttons (10)
  while (buttonNum < numButtons) {
    //i need to print a button that is associate with a 1 of five colors
    fill( fillColor[buttonArray[buttonNum]]);
    float buttonX = (buttonNum+1)*spacer + (buttonNum)*buttonWidth;
    rect(buttonX, height/4, buttonWidth, buttonHeight); 
    buttonNum++;
  }
}

void mouseClicked() {
  //when the mouse is clicked if its touching one of the box change the box color to
  //the next color in the colorfill aray by changing the index number in the 
  //button array index.
  //while the button number  is less then the number of buttons
  int buttonNum = 0;

  while (buttonNum < numButtons) {
    //set the position of where each button is
    float buttonX = (buttonNum+1)*spacer + (buttonNum)*buttonWidth;
    //if my mouse is over buttonNum and I click it
    if ((mouseX >= buttonX && mouseX <= buttonX + buttonWidth)
      && (mouseY >= height/4  && mouseY <= height/4 + buttonHeight))
    {
      //make the number go up one

      ellipseMode(CORNER);
      fill(0);
      ellipse(buttonX, height/4, buttonWidth, buttonHeight);
      if (buttonArray[buttonNum] >= 4) {
        buttonArray[buttonNum] = 0;
      } else {
        buttonArray[buttonNum]++;
      }
      fill( fillColor[buttonArray[buttonNum]]);
      rect(buttonX, height/4, buttonWidth, buttonHeight);
    } 
    buttonNum++;
  }
} 