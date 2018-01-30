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
public abstract class Sprite  {
    int height;
    int width;
    int x;
    int y;
    String spriteNameOne;
    String spriteNameTwo;

    public Sprite(int height, int width, int x, int y, String spriteNameOne, String spriteNameTwo) {
        this.height = height;
        this.width = width;
        this.x = x;
        this.y = y;
        this.spriteNameOne = spriteNameOne;
        this.spriteNameOne = spriteNameTwo;
    }

    public int getHeight() {
        return height;
    }

    public int getWidth() {
        return width;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public String getSpriteNameOne() {
        return spriteNameOne;
    }
    
    public String getSpriteNameTwo() {
        return spriteNameOne;
    }
    
    public abstract void move(); 
    
}
