/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SpaceInvaders;

import java.util.ArrayList;

/**
 *
 * @author elizabethletourneau
 */
public class Space {
    ArrayList <Sprite> sprites;
    ArrayList<TankSprite> tank;
    public Space (){
        sprites = new ArrayList<Sprite>();
        sprites.add(new SmallInvader(20, 20, 50, 30));
        sprites.add(new MediumInvader(20, 20, 50, 60));
        sprites.add(new LargeInvader(20, 20, 50, 90));
        
        // This will remain empty until the user starts
        // adding new clouds with the user interface
        tank = new ArrayList<TankSprite>();
        tank.add(new TankSprite(20, 20, 250, 400));
    }
    public ArrayList<Sprite> getSprites()
    {
        return sprites;
    }
    
    public ArrayList<TankSprite> getTank()
    {
        return tank;
    }
    
    
    
    public void moveSprites()
    {
        for (Sprite sprite : sprites)
        {
            sprite.move();
        }
    }
    
    public void moveTankLeft()
    {
    for (TankSprite sprite : tank)
        {
           sprite.setX(sprite.getX()-10);
        }
    }
    
    public void moveTankRight()
    {
       for (TankSprite sprite : tank)
        {
           sprite.setX(sprite.getX()+10);
        } 
    }
}



