
color [] rectColor = {
  color(227, 41, 41), //red
  color(255, 163, 102), //orange
  color(250, 250, 0), //yellow
  color(0, 255, 0), //green
  color(0, 0, 255), 
};

int numberColors = 5;
int []rectColorIndex = new int [numberColors];

int numRect = 3;
int [] rectX = new int[numRect];
int [] rectY = new int[numRect];

int initialX;
int initialY;
int spacer = 30;
final int rectWidth = 80;
final int rectHeight = 100;

void setup () {
 size (500, 500);
 background(0);
 noStroke();
 
  int colorNum = 0;
  while ( colorNum < numberColors){
    rectColorIndex[colorNum] = (int)random(0, 5);
    colorNum++;
  }
  int rectNum = 0;
  while (rectNum < numRect){
 initialY = height/2;
 initialX = width/5 + ((rectNum +1) * spacer + (rectNum) * rectWidth);
 rectX[rectNum] = initialX;
 rectY[rectNum] = initialY;
 rectNum++;
  } 
}

void draw(){

int rectNum = 0;
while(rectNum < numberColors){
int colorNum = 0;
while (colorNum < numberColors) {
  if (rectColorIndex[colorNum] > rectColorIndex.length -1){
    rectColorIndex[colorNum] = 0;
  } else {
    rectColorIndex[colorNum]++;
}
fill(rectColor[rectColorIndex[numberColors]]);
colorNum++;
}
rect([rectX[rectNum], rectY[rectNum], rectWidth, rectHeight);
if (rectNum < rectX.length-1){
  rectNum = 0;}
  else {
    rectNum =0;}
}
}  