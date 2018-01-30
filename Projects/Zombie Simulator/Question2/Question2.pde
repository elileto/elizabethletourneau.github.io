//create a "survivor" class, name, location, infected boolean, injured boolean, number of bullets  //<>// //<>// //<>//
//carried
//create an array of survivors and draw them on the screen
//choose a certain percentage of survivors to be infected to begin with
int numSurvivors = 100;
int numReinforcements = 2;
int reinforcementCounter = 0;
ArrayList<Survivor> survivor = new ArrayList<Survivor>();


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
  float survivorDirection;
}




int survivorSpeed;
float infectedSpeed = 4;






void setup() {
  size(750, 750);
  noStroke();
  for ( int i = 0; i < numSurvivors; i++) {
    survivor.add(new Survivor()); 
    survivor.get(i).diameter = 20;
    int initialX = (int)random(survivor.get(i).diameter/2, width-survivor.get(i).diameter/2);
    int initialY = (int)random(survivor.get(i).diameter/2, height-survivor.get(i).diameter/2);
    survivor.get(i).x = initialX;
    survivor.get(i).y = initialY;
    float x = random(1);
    if (x <=0.20) {
      survivor.get(i).name = "infected";
      survivor.get(i).infected = true;
      survivor.get(i).injured = false;
      survivor.get(i).bullets = 0;
    }
    if (x > 0.20 && x <= 0.50)
    {
      survivor.get(i).name = "injured";
      survivor.get(i).infected = false;
      survivor.get(i).injured = true;
      survivor.get(i).bullets = 3;
    }
    if (x > 0.50)
    {
      survivor.get(i).name = "healthy";
      survivor.get(i).infected = false;
      survivor.get(i).injured = false;
      survivor.get(i).bullets = 3;
    }
  }
}

void draw () {
  background(25);
  frameRate(30);

  drawSurvivor(survivor);
  healthCounter(survivor);
  labelSurvivor(survivor);
  infectedTarget(survivor);

  moveSurvivor(survivor);
  
  //check collision every frame:
  for (int i = 0; i < survivor.size(); i++) {

    if (survivor.get(i).infected == true)
    {
      for (int j = 0; j < survivor.size(); j++) {
        if (survivor.get(j).infected == false) {
          if (checkCollision(survivor.get(i), survivor.get(j)) == true) {
            if (survivor.get(j).injured == true) {
              float z = random(1);
              if ((z > 0 && z <= 0.60) || survivor.get(j).bullets == 0) {
                survivor.get(j).infected = true;
                survivor.get(j).name = " infected";
              } else {
                survivor.get(j).bullets--;
                survivor.get(j).x = (int)random(survivor.get(i).diameter/2, width- survivor.get(i).diameter/2);
                survivor.get(j).y = (int)random(survivor.get(i).diameter/2, height- survivor.get(i).diameter/2);
              }
            }
            
            //check if an infected survior is touching a healthy survivor 
            //if yes, healthy survivor should become infected 30% of the time
            else if (survivor.get(j).injured == false) {
              float z = random(1);
              if ((z > 0 && z <= 0.30) || survivor.get(j).bullets == 0) {
                survivor.get(j).infected = true;
                survivor.get(j).name = " infected";
              } else {
                survivor.get(j).bullets--;
                survivor.get(j).x = (int)random(survivor.get(i).diameter/2, width- survivor.get(i).diameter/2);
                survivor.get(j).y = (int)random(survivor.get(i).diameter/2, width- survivor.get(i).diameter/2);
              }
            }
          }
        }
      }
    }
  }


  //Use your function from above to check the percentage of healthy survivors every frame. 
  //If the percentage gets lower than 20%, reinforcements will be called in to help your shrinking group —
  //2 new non-infected survivors will spawn, and there will be a 25% chance they will be injured.   

  if (healthCounter(survivor) <= (int)(survivor.size() * 0.2)) {
    if ( reinforcementCounter <= 3 ) {


      for ( int i = 0; i <= numReinforcements; i++) {
        survivor.add(new Survivor()); 
        survivor.get(i).diameter = 20;
        int initialX = (int)random(survivor.get(i).diameter/2, width-survivor.get(i).diameter/2);
        int initialY = (int)random(survivor.get(i).diameter/2, height-survivor.get(i).diameter/2);
        survivor.get(i).x = initialX;
        survivor.get(i).y = initialY;
        survivor.get(i).infected = false;
        float x = random(1);
        if (x < 0.25) {
          survivor.get(i).injured = true;
          survivor.get(i).name = "injured";
          fill(255, 255, 0, 150);
        } else {
          survivor.get(i).injured = false;
          survivor.get(i).name = "healthy";
        }
      } reinforcementCounter++;
    }
  }
      //Display Number of Bullets left:  
    fill(255);
    smooth();
    text("Bullets Remaining: " + bulletCounter(survivor), 20, 60);
}

void drawSurvivor( ArrayList<Survivor>  s) {
  for ( int i = 0; i < s.size(); i++) {

    if (s.get(i).name == "infected" || s.get(i).infected == true)
    {
      fill(255, 0, 0, 150);
    } else if (s.get(i).name == "injured")
    {
      fill(255, 255, 0, 150);
    } else 
    {
      fill(0, 255, 0, 150);
    }

    ellipse( s.get(i).x, s.get(i).y, s.get(i).diameter, s.get(i).diameter);
  }
  fill(255, 0, 0);
}

//write two functions that take the array of survivors as a parameter
//one will return a percentage of survivors who are completely healthy among all the survivors
//color code the type healthy, infected or injured

int healthCounter( ArrayList<Survivor>  s) {
  int numberOfInfected = 0;
  int numberOfHealthy = 0;
  for ( int i = 0; i < s.size(); i++) {

    if (s.get(i).name == "infected" || s.get(i).infected == true)
    {
      numberOfInfected ++;
    } else if (s.get(i).name == "injured")
    {
      numberOfHealthy++;
    } else 
    {
      numberOfHealthy++;
    }
  }
  fill(255, 0, 0);
  text("Percentage of infected: " + numberOfInfected  + "%", 20, 20);
  
  fill(0, 255, 0);
  text("Percentage of healthy: " + numberOfHealthy+ "%", 20, 40);
  return numberOfHealthy;
}

void labelSurvivor( ArrayList<Survivor>  s) { 
  int z = 0;
  boolean labelledSurvivor = false;
  for (int i = 0; i < s.size(); i++)
  {
    if (dist(s.get(i).x, s.get(i).y, mouseX, mouseY) < s.get(i).diameter)
    {   
      labelledSurvivor = true;
      z = i;
    }
    if (labelledSurvivor == true) {

      fill(255, 255, 255, 100);
      stroke(0);
      rectMode(CENTER);
      rect(s.get(z).x, s.get(z).y-40, 130, 40);
      fill(0);
      textSize(15);
      textAlign(LEFT, TOP);
      String name = "Name: " + s.get(z).name;
      String bullets = "Bullets " + s.get(z).bullets;
      text(name, s.get(z).x-60, s.get(z).y-60);
      text(bullets, s.get(z).x-60, s.get(z).y-40);
      noStroke();
    }
  }
}

//second function will return the number of bullets in the possession of healthy survivors
//write code that calls the two functions and draws the numbers with appropriate labels
int bulletCounter( ArrayList<Survivor>  s) { 
  int bulletCount = 0;
  for ( int z = 0; z < s.size(); z++) {
    if (s.get(z).infected == false) {
      bulletCount =  bulletCount +s.get(z).bullets;
    }
  }
  return bulletCount;
}

//movement wandering movement, 
//infected should slowly wander towards the closest of the non infected survivors
//healthy and injured should wander away from the closest infected
//healthy move quicker then injured
void moveSurvivor(ArrayList<Survivor> s) {


  for ( int g = 0; g < s.size(); g++) {

    if (s.get(g).infected == true) {

      s.get(g).nextX = s.get(g).x + int((infectedSpeed)*cos(s.get(g).survivorDirection));
      s.get(g).nextY = s.get(g).y + int((infectedSpeed) * sin(s.get(g).survivorDirection));

      int crossProduct = (s.get(g).nextX -s.get(g).x)*(s.get(g).targetY - s.get(g).y) -
        (s.get(g).nextY - s.get(g).y)*(s.get(g).targetX - s.get(g).x);

      if (dist(s.get(g).nextX, s.get(g).nextY, s.get(g).targetX, s.get(g).targetY) > 15)
      {
        s.get(g).x = s.get(g).nextX;
        s.get(g).y = s.get(g).nextY;
      } 
      final int angle = 30;
      if (crossProduct < 0)
      {
        s.get(g).survivorDirection -= radians(angle);
      } else {
        s.get(g).survivorDirection += radians(angle);
      }
    } else if (s.get(g).infected == false) {
      if ( s.get(g).injured == true) {
        survivorSpeed = 3;
      } else { 
        survivorSpeed = 5;
      }
      s.get(g).nextX = s.get(g).x + int((survivorSpeed) * -cos(s.get(g).survivorDirection));
      s.get(g).nextY = s.get(g).y + int((survivorSpeed) * sin(s.get(g).survivorDirection));

      int crossProduct = (s.get(g).nextX -s.get(g).x)*(s.get(g).targetY - s.get(g).y) -
        (s.get(g).nextY - s.get(g).y)*(s.get(g).targetX - s.get(g).x);

      if (dist(s.get(g).nextX, s.get(g).nextY, s.get(g).targetX, s.get(g).targetY) > 30)
      {
        s.get(g).x = s.get(g).nextX;
        s.get(g).y = s.get(g).nextY;
      } 
      final int angle = 30;
      if (crossProduct < 0)
      {
        s.get(g).survivorDirection -= radians(angle);
      } else {
        s.get(g).survivorDirection += radians(angle);
      }
    }
  }
}


void infectedTarget( ArrayList <Survivor> s) {

  for (int k = 0; k < s.size(); k++) {

    //calculate the closest infected survivor
    //the closest infected survivor to a healthy survivor = the distance between the healthy survivor and its closest infected survivor min

    if ( s.get(k).infected == true) { //if the survivor is infected
      float closestDistance = 9999;
      for (int j = 0; j < s.size(); j++) { //for the array of survivors

        if ( s.get(j).infected == false ) { //if the survivor is healthy
          int px = s.get(k).x;
          int qx = s.get(j).x;
          int py = s.get(k).y;
          int qy = s.get(j).y;

          if (dist (px, py, qx, qy) < closestDistance)
            //if the distance between the infected 
            //survivor to the next healthy survivor is smaller then 9999
          {
            //closest distance is the distance between the infected and the closer healthy survivor
            closestDistance = dist(px, py, qx, qy);
            s.get(k).targetX = qx;
            s.get(k).targetY = qy;
            s.get(j).targetX = px;
            s.get(j).targetY = py;
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