/**
*AdHocLevelSectionCreator.pde
*Purpose: Main processing file for a GUI to create and output 8x8x16 level sections as textfiles for later input to Unity for ad hoc level creation.
*
*@author Daniel Ingrey
*@version 1.0
*/

int edge = 8*40; //the edge in pixels of the graphical grid representation of the 8x8 layers
boolean infoScreen = true; //while true the information/title screen is displayed for section type selection
boolean overB = false; //when true the mouse cursor is over a button
float mx,my; //uses mouse x and y coordinates for conversion from floats to integers
int[][][] arrSquare = new int[16][8][8]; //array to hold the section
int layer; //current layer of the array
LayerText lt; 
FilePrint fp; 
StartMenu sm;
String section = new String(); //holds the section type's name as a string for later use to name textfiles

/**
*Main Processing function. Used for setting up the display and creating instances of classes used by the program.*
*/
void setup() {
  size(700,600); 
  background(50);  
    textSize(20);
    text("Ad Hoc Level Section Creator\n       for Lackadaisical", 150, 100);    
    textSize(18);
    text("By Daniel Ingrey", 200, 160);
    textSize(18);
    text("Select the section you would like to create by\nclicking the square on the grid:", 150, 195);
    textSize(14);
    text("Top left corner - Top wall - Top right corner\n\nLeft wall - Interior - Right wall\n\nBottom left corner - Bottom wall - Bottom right corner", 300,310);      
    sm = new StartMenu();
    lt = new LayerText(); 
}

/**
*Called after setup. Looping function of Processing used to continuously update the display. 
*/
void draw() {  
  //display the information/title/section select screen
  if(infoScreen) {
   sm.displayGrid();
   textSize(20);
   text(section, 550,550);    
  }else {
    //display main GUI interface for section creation
    lt.display();
    if(layer < 16) { //while we haven't completed all layers of the array    
      for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
          //display first layer by drawing 8x8 40 pixel black squares representing 0's
          if(arrSquare[layer][i][j] == 0 && layer == 0) {
            fill(0);
            stroke(100);      
            rect(j*40,i*40,40,40);
          } else if (arrSquare[layer][i][j] == 0 && layer > 0) {
            if (arrSquare[layer-1][i][j] == 1) { //if previous layer's array coordinate at this position was selected, shade rectangle grey
              fill(150);
              stroke(100);      
              rect(j*40,i*40,40,40);
            }else if(arrSquare[layer][i][j] == 0) { //if is wasn't selected shade it black
              fill(0);
              stroke(100);      
              rect(j*40,i*40,40,40);
            }
          } else { //if current array coordinate of this layer is selected shade it white
            fill(255);
            stroke(100);      
            rect(j*40,i*40,40,40);
          }
        }
       }
       
       overButton();
      
      if(mouseX >= 40){ 
        mx = float(mouseX / 40); //divide mouse x coordinate by 40, the width of a square
      } else {
        mx = float(0); //if the x coordinate is less than 40 set it to 0
      }
      if(mouseY >= 40){
        my = floor(float(mouseY / 40));
      } else {
        my = floor(float(0));
      }         
     
      if(overSquare()) {   
         fill(255);
         rect(int(mx*40),int(my*40),40,40); //colour the square the cursor is hovering over white
        }      
     
    } else { //all layers have been filled; output result to file, exit program
      fp = new FilePrint();  
      fp.createFile(section, arrSquare);
      exit();
    }
  } 
}

/**
*Check if mouse cursor is within the displayed grid representation of the layer.
*
*@return true if the cursor is within the edges of the grid, false if not.
*/
boolean overSquare() {
   if (mouseX >= 0 && mouseX < edge && 
      mouseY >= 0 && mouseY < edge) {
    return true;
  } else {
    return false;
  }
}

/**
*Processing's mouseClicked function is called when the mouse button is pressed.
*/
void mouseClicked() {
  if(infoScreen) { 
    if(sm.overSquare()){ //if the mouse is clicked within the edges of the section selection grid     
    section = sm.selectSection(); //sets section string variable to the section type's name, based on which type was chosen from the initial information/title/selection screen   
    infoScreen = false;
    background(50);    
    }
  } else {
    if(overSquare()) { //if the mouse is clicked on a square in a layer of the 8x8x16 array's displayed grid 
      background(50);
      arrSquare[layer][int(my)][int(mx)] ^= 1; //use bitwise XOR on corresponding position in array to flip 1 to 0 and vice versa. (ie. 1 ^ 1 = 0, 1 ^ 0 = 1) 
      lt.display(); //refresh text display     
    } else if(overB) { //if the mouse is clicked on the "next layer" button
      background(50); 
      layer++; //increment the current layer
      lt.nextNum(); //increment the current layer for display
      lt.display(); //refresh text display      
    }
  }
   
}

/**
*Check is mouse cursor is hovering over the next layer button.
*
*@return true if mouse is over the next layer button, false if not.
*/
void overButton() {
  if((mouseX >= 400 && mouseX <= 500) && (mouseY >= 400 && mouseY <= 450)) {
    fill(0); //if the mouse cursor is over the button shade it black
    stroke(255);    
   rect(400,400,100,50);
   overB = true;
  } else {
    fill(100); //shade button grey when mouse cursor is not hovering over it
    stroke(255);
    rect(400,400,100,50);
    overB = false;
  }
}

