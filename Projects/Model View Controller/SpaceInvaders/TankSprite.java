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
public class TankSprite {

   protected int height;
   protected int width;
   protected int x;
   protected int y;
   public static String IMAGE_NAME  = "tankSprite.png";

    public TankSprite(int height, int width, int x, int y) {
        this.height = height;
        this.width = width;
        this.x = x;
        this.y = y;
    }

    public int getHeight() {
        return (int)height;
    }

    public int getWidth() {
        return (int)width;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setX(int x) {
        this.x = x;
    }
   
    public void moveLeft(){}

    public String getImageName() {
        return IMAGE_NAME;
    }
   
 
   
    
}
