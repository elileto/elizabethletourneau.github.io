
//int numData = 100;
//int [] array1 = new int [numData];
final int [] testCase1 = {98, 1, 1};
  final int [] testCase2 = {1, 98}; 
final int [] testCase3 = {100};
final int [] testCase4 = {100, -1, 1};
void setup() {
  size(500, 500);
  background(0);
  smooth();
  //Test cases
  findIndex(testCase1); //  returns 2, and 99
//  findIndex(testCase2); //prints -1 , sum under 100
// findIndex(testCase3); // prints -1
//  findIndex(testCase4); // prints -1


}

void draw() {
}


int findIndex(int[] data)
{
/*  
      int dataNumi = 1;
      while ( dataNumi < data.length + 1)
      {int [] datai = data;
      dataNumi++;
      }
*/      
      int sum = 0; 
  int dataNum = 0;
  while (dataNum < data.length) {
    sum = sum + data[dataNum]; 
    if ( sum < 100 && sum + data[dataNum] >= 100){
        println(sum);
  fill(255);
  text("Sum of intergers: "+sum, width/2-100, height/2);
  text("Number of dataspots: "+dataNum, width/2-100, height/2 + 20); 
    } else {
      dataNum++;}
    } 
if (sum >= 100 || sum + data[dataNum-1] < 100){
  text("-1", width/2-100, height/2 + 20);
  return -1;  
}
else{
  return sum;
  }

}