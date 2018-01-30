/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SpaceInvaders;

/**
 *
 * @author elizabethletourneau
 */
public class SmallInvader extends Sprite{
    int frames ;
    int direction = 1;
    public SmallInvader(int height, int width, int x, int y) {
        super(height, width, x, y, "smallInvaderOne.png", "smallInvaderTwo.png" );
    }

    @Override
    public void move() {
        int lvFrame = 20;
        int screenWidth = 500;
        frames++;
         if (frames % lvFrame == 0){

          if (x + width  > screenWidth || x < 50){
           direction *= -1;
           y += 20;
           x += 0;
          }
         this.x += direction * 20 ;
      
            
        }
    }
           
}
    
   

