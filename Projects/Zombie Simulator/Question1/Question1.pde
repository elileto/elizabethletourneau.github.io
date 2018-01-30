//create a "survivor" class, name, location, infected boolean, injured boolean, number of bullets  //<>// //<>// //<>// //<>//
//carried
//create an array of survivors and draw them on the screen
//choose a certain percentage of survivors to be infected to begin with
int numSurvivors = 100;
int numReinforcements = 2;
Survivor [] survivor = new Survivor[numSurvivors];
Survivor [] reinforcement = new Survivor[numReinforcements];
class Survivor {
  int x;
  int y;
  int diameter;
  boolean infected;
  boolean injured;
  int bullets;
  String name;
  int targetX;
  int targetY;
  boolean targeted;
  int nextX;
  int nextY;
  int survivorState;
  float survivorDirection;
  Survivor() {
    float x = random(1);
    if (x <=0.20) {
      this.name = "infected";
      this.infected = true;
      this.injured = false;
      this.survivorState = infectedWanderState;
      this.bullets = 0;
    }
    if (x > 0.20 && x <= 0.30)
    {
      this.name = "injured";
      this.infected = false;
      this.injured = true;
      this.survivorState = healthyWanderState;
      this.bullets = 3;
    }
    if (x > 0.30)
    {
      this.name = "healthy";
      this.infected = false;
      this.injured = false;
      this.survivorState = healthyWanderState;
      this.bullets = 3;

      ;
    }
  }
}


int survivorSpeed = 2;
int infectedSpeed = 4;
int infectedWanderState = 1;
int healthyWanderState = 2;
int collidedState = 3;





void setup() {
  size(750, 750);
  noStroke();
  int survivorNum = 0;
  while ( survivorNum < numSurvivors) {
    survivor[survivorNum] = new Survivor();
    survivor[survivorNum].diameter = 20;
    int initialX = (int)random(survivor[survivorNum].diameter/2, width-survivor[survivorNum].diameter/2);
    int initialY = (int)random(survivor[survivorNum].diameter/2, height-survivor[survivorNum].diameter/2);
    survivor[survivorNum].x = initialX;
    survivor[survivorNum].y = initialY;
    survivorNum++;
  }
}

void draw () {
  background(25);
  frameRate(30);

  drawSurvivor(survivor);
  labelSurvivor(survivor);
  //   for (int k = 0; k < numSurvivors; k++){
  infectedTarget(survivor);

  moveSurvivor(survivor);
  //check collision every frame:
  for (int i = 0; i < numSurvivors; i++) {

    if (survivor[i].infected == true)
    {
      for (int j = 0; j < numSurvivors; j++) {
        if (survivor[j].infected == false) {
          if (checkCollision(survivor[i], survivor[j]) == true) {
            if (survivor[j].injured == true) {
              float z = random(1);
              if ((z > 0 && z <= 0.60) || survivor[j].bullets == 0) {
                survivor[j].infected = true;
                survivor[j].name = " infected";
              } else {
                survivor[j].bullets--;
                survivor[j].x = width/2;
                survivor[j].y = height/2;
              }
            }
            //check if an infected survior is touching a healthy survivor 
            //if yes, healthy survivor should become infected 30% of the time
            else if (survivor[j].injured == false) {
              float z = random(1);
              if ((z > 0 && z <= 0.30) || survivor[j].bullets == 0) {
                survivor[j].infected = true;
                survivor[j].name = " infected";
              } else {
                survivor[j].bullets--;
                survivor[j].x = width/2;
                survivor[j].y = height/2;
              }
            }
          }
        }
      }
    }
  }  

  //use function checkCollision to check the percentage of healthy survivors every frame
     // if the percentage gets lower than 20%, reinforcements will be called in to help 
    // your shrinking group - 2 non infected survivors will spawn with 25% chancce they will be injured

int healthySurvivor = 0;
  for (int i = 0; i < numSurvivors; i++) {
    if (survivor[i].infected == true) {
      
      for (int j = 0; j < numSurvivors; j++) {
        if (survivor[j].infected == false) {
          healthySurvivor++;
          if (checkCollision(survivor[i], survivor[j])){
            
           if (healthySurvivor < (int)numSurvivors * 0.20){
             fill(0, 0, 255);
        ellipse(width/2, height/2, 100, 100);
             
             
             
             /*for (int m = 0; m < numReinforcements; m++){
          reinforcement[m] = new Survivor();
          reinforcement[m].diameter = 20;
    int initialX = (int)random(survivor[m].diameter/2, width-survivor[m].diameter/2);
    int initialY = (int)random(survivor[m].diameter/2, height-survivor[m].diameter/2);
    reinforcement[m].x = initialX;
    reinforcement[m].y = initialY;
    reinforcement[m].name = "healthy";
    reinforcement[m].injured = false;
    reinforcement[m].infected = false;
           }
           drawSurvivor(reinforcement);
           moveSurvivor(reinforcement); */
           }
            
          }
          }
          }
        }
      }
    }

    //write two functions that take the array of survivors as a parameter
    //one will return a percentage of survivors who are completely healthy among all the survivors
    //color code the type healthy, infected or injured

    void drawSurvivor( Survivor [] s) {
      int numberOfInfected = 0;
      int numberOfHealthy = 0;
      for ( int i = 0; i < numSurvivors; i++) {

        if (s[i].name == "infected" || s[i].infected == true)
        {
          fill(255, 0, 0, 150);
          numberOfInfected ++;
        } else if (s[i].name == "injured")
        {
          fill(255, 255, 0, 150);
          numberOfHealthy++;
        } else 
        {
          fill(0, 255, 0, 150);
          numberOfHealthy++;
        }

        ellipse( s[i].x, s[i].y, s[i].diameter, s[i].diameter);
      }
      fill(255, 0, 0);
      text("Percentage of infected: " + numberOfInfected + "%", 20, 20);
      fill(0, 255, 0);
      text("Percentage of healthy: " + numberOfHealthy+ "%", 20, 40);
    }

    //second function will return the number of bullets in the possession of healthy survivors
    //write code that calls the two functions and draws the numbers with appropriate labels
    void labelSurvivor( Survivor [] s) { 
      int z = 0;
      boolean labelledSurvivor = false;
      for (int i = 0; i < numSurvivors; i++)
      {
        if (dist(s[i].x, s[i].y, mouseX, mouseY) < s[i].diameter)
        {   
          labelledSurvivor = true;
          z = i;
        }
        if (labelledSurvivor == true) {

          fill(255, 255, 255, 100);
          stroke(0);
          rectMode(CENTER);
          rect(s[z].x, s[z].y-40, 130, 40);
          fill(0);
          textSize(15);
          textAlign(LEFT, TOP);
          String name = "Name: " + s[z].name;
          String bullets = "Bullets " + s[z].bullets;
          text(name, s[z].x-60, s[z].y-60);
          text(bullets, s[z].x-60, s[z].y-40);
          noStroke();
        }
      }
    }
    //movement wandering movement, 
    //infected should slowly wander towards the closest of the non infected survivors
    //healthy and injured should wander away from the closest infected
    //healthy move quicker then injured

    void moveSurvivor(Survivor [] s) {


      for ( int g = 0; g < numSurvivors; g++) {

        if (s[g].infected == true) {

          s[g].nextX = s[g].x + int((infectedSpeed)*cos(s[g].survivorDirection));
          s[g].nextY = s[g].y + int((infectedSpeed) * sin(s[g].survivorDirection));

          int crossProduct = (s[g].nextX -s[g].x)*(s[g].targetY - s[g].y) -
            (s[g].nextY - s[g].y)*(s[g].targetX - s[g].x);

          if (dist(s[g].nextX, s[g].nextY, s[g].targetX, s[g].targetY) > 15)
          {
            s[g].x = s[g].nextX;
            s[g].y = s[g].nextY;
          } 
          final int angle = 30;
          if (crossProduct < 0)
          {
            s[g].survivorDirection -= radians(angle);
          } else {
            s[g].survivorDirection += radians(angle);
          }
        } else if (s[g].infected == false) {
          s[g].nextX = s[g].x + int((survivorSpeed)* -cos(s[g].survivorDirection));
          s[g].nextY = s[g].y + int((survivorSpeed) * sin(s[g].survivorDirection));

          int crossProduct = (s[g].nextX -s[g].x)*(s[g].targetY - s[g].y) -
            (s[g].nextY - s[g].y)*(s[g].targetX - s[g].x);



          //     float differenceX = s[g].targetY -s[g].y;
          //   float differenceY = s[g].targetX =s[g].x;

          // survivorDirection = atan2(differenceY, differenceX);
          if (dist(s[g].nextX, s[g].nextY, s[g].targetX, s[g].targetY) > 30)
          {
            s[g].x = s[g].nextX;
            s[g].y = s[g].nextY;
          } 
          final int angle = 30;
          if (crossProduct < 0)
          {
            s[g].survivorDirection -= radians(angle);
          } else {
            s[g].survivorDirection += radians(angle);
          }
        }
      }
    }


    void infectedTarget(Survivor [] s) {

      for (int k = 0; k < numSurvivors; k++) {

        //calculate the closest infected survivor
        //the closest infected survivor to a healthy survivor = the distance between the healthy survivor and its closest infected survivor min

        if ( s[k].infected == true) { //if the survivor is infected
          float closestDistance = 9999;
          for (int j = 0; j < numSurvivors; j++) { //for the array of survivors

            if ( s[j].infected == false ) { //if the survivor is healthy
              int px = s[k].x;
              int qx = s[j].x;
              int py = s[k].y;
              int qy = s[j].y;

              if (dist (px, py, qx, qy) < closestDistance)
              //if the distance between the infected 
              //survivor to the next healthy survivor is smaller then 9999
              {
                //closest distance is the distance between the infected and the closer healthy survivor
                closestDistance = dist(px, py, qx, qy);
                s[k].targetX = qx;
                s[k].targetY = qy;
                s[j].targetX = px;
                s[j].targetY = py;
              }
            }
          }
        }
      }
    }


    //function called checkCollision
    //takes two survivor objects and returns a boolean
    //returns true if touching/overlapping, false otherwise
    //check every frame (check if true in draw)

 
    boolean checkCollision (Survivor i, Survivor h)
    {
      if (dist(i.x, i.y, h.x, h.y) < 30) {

        return true;
      } else {
        return false;
      }
    }

    //other requirements:
    //infected win about 50% of the time - keep population below 20%
    //humans win 50% of the time - keep population above 20%