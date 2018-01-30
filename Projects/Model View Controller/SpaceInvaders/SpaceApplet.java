/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SpaceInvaders;

import processing.core.PApplet;
import processing.event.KeyEvent;


/**
 *
 * @author elizabethletourneau
 */
public class SpaceApplet extends PApplet {
    Space space;
    SpaceUI spaceUI;


    @Override
    public void settings()
    {
        // Set the size of the drawing's window
        size(500,500);

    }
    
    // Called once when the program starts
    @Override
    public void setup()
    {
        space = new Space();
        spaceUI = new SpaceUI(this, space);
    }
    
    @Override
    public void draw()
    {
        background(0, 0, 0);
        spaceUI.frameCount++;
        space.moveSprites();        
        // Tell the UI to draw itself
        spaceUI.drawSpace();
   // System.out.println(spaceUI.frameCount);
    }
    
    
   // This method is called every time the keys pressed
     public void keyPressed(KeyEvent e) {
        switch (e.getKeyCode()) {
            case 37:
                 space.moveTankLeft();
                break;
            case 39:
                 space.moveTankRight();
                break;
        }
     }   
    
    
       
    
   
    // Kick start Processing and its main draw loop
    public static void main(String[] args)
    {
        // In your own example, replace GardenApplet with
        // your class's name
        PApplet.main(SpaceApplet.class.getCanonicalName());
    }
}