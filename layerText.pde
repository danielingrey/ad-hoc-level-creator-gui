/**
*layerText.pde
*Displays text on the layer selection screen component of the GUI.
*
*@author Daniel Ingrey
*@version 1.0
*/
class LayerText {
  int layerNum = 0; //current layer number
  
  /**
  * Constructor for the LayerText class.
  */
  LayerText(){  
  }
  
  /**
  *Handles display and formatting of text on screen.
  */
  void display() {   
   fill(255);
   textSize(15);
   text("Grid of current layer in 3D binary array,\nclick a square to set 0 to 1\nand vice versa, previous layer's\nselections shaded grey",340,40);
   textSize(24);
       
    text("layer: " + layerNum,20,400);
    
    textSize(15);
    text("Current layer in the 3D array,\nstarting from the bottom",20,420);
   
   textSize(24);
   if(layerNum < 15) text("next >>" ,400,390);
   else text("finish/output >>" ,400,385);
   textSize(15);
   text("click rectangle above to\nproceed to next layer", 400, 470); 
  }
  
  /**
  *Increments layer number for display.
  */
  void nextNum() {
    layerNum++;
  }
}
