
package SpaceInvaders;
import java.util.ArrayList;
import processing.core.PApplet;
import processing.core.PImage;
import processing.core.*;
/**
 *
 * @author elizabethletourneau
 */
public class SpaceUI {
    protected SpaceApplet parent;
    protected Space space;
    protected ArrayList<PImage> images;
    protected int frameCount = 0;
    protected PImage tankImage;
    
    public SpaceUI(SpaceApplet newParent, Space newSpace){
        parent = newParent;
        space = newSpace;
        frameCount++;

        images = new ArrayList<PImage>();
        tankImage = parent.loadImage(TankSprite.IMAGE_NAME);
        for (Sprite sprite : space.getSprites())
        { 
            
            int lvFrame = 20;
            if (frameCount % lvFrame == 0){
            images.add(parent.loadImage(sprite.getSpriteNameOne()));
            }
            else{  
            images.add(parent.loadImage(sprite.getSpriteNameTwo()));
            }   
        }
        // Set the image mode to CENTER because the x/y coordinates
        // in the model represent the middle of the item
        parent.imageMode(PApplet.CENTER);
    }
        
    public void drawSpace()
    {    
       

 //Draw clouds first so they are layered behind other stuff
       for (TankSprite tank : space.getTank())
        {
            parent.image(tankImage, 
                         tank.getX(), tank.getY(),
                         tank.getWidth(), tank.getHeight());
        }
        
        // Draw garden items second
        for (int i=0; i < space.getSprites().size(); i++)
        {
            Sprite sprite = space.getSprites().get(i);
           
            parent.image(images.get(i), 
                         sprite.getX(), sprite.getY(),
                         sprite.getWidth(), sprite.getHeight());
        }
    }
}