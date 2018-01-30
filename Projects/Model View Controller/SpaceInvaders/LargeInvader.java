
package SpaceInvaders;

public class LargeInvader extends Sprite {
    int frames ;
    int direction = 1;
    public LargeInvader(int height, int width, int x, int y) {
        super(height, width, x, y, "largeInvaderOne.png", "largeInvaderTwo.png");
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
           x+= 0;
          }
         this.x += direction * 20 ;
    
        
          }
    }
    
}
