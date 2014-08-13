class StartMenu {
  int gridEdgeX = 140;
  int gridEdgeY = 290;
  
StartMenu () {}
  
  void displayGrid() {
   for(int i = 1; i < 4; i++){
      for(int j = 1; j < 4; j++){        
          fill(i*30,i*30,j*30);          
          stroke(100);                
          rect(j*40+100,i*40+250,40,40);                   
      }
    } 
  }  
    
  boolean overSquare() {
   if (mouseX >= gridEdgeX && mouseX < gridEdgeX+120 && 
      mouseY >= gridEdgeY && mouseY < gridEdgeY+120) {
    return true;
    } else {
      return false;
    }
  }
  
  String selectSection() {
    if(mouseX >= gridEdgeX && mouseX < gridEdgeX+40 && 
      mouseY >= gridEdgeY && mouseY < gridEdgeY+40) {        
        return "cornerTL";        
    } else if(mouseX >= gridEdgeX+40 && mouseX < gridEdgeX+80 && 
      mouseY >= gridEdgeY && mouseY < gridEdgeY+40) {
        return "wallT";
    } else if(mouseX >= gridEdgeX+80 && mouseX < gridEdgeX+120 && 
      mouseY >= gridEdgeY && mouseY < gridEdgeY+40) {
        return "cornerTR";
    } else if(mouseX >= gridEdgeX && mouseX < gridEdgeX+40 && 
      mouseY >= gridEdgeY+40 && mouseY < gridEdgeY+80) {
        return "wallL";
    } else if(mouseX >= gridEdgeX+40 && mouseX < gridEdgeX+80 && 
      mouseY >= gridEdgeY+40 && mouseY < gridEdgeY+80) {
        return "interior";
    } else if(mouseX >= gridEdgeX+80 && mouseX < gridEdgeX+120 && 
      mouseY >= gridEdgeY+40 && mouseY < gridEdgeY+80) {
        return "wallR";
    } else if(mouseX >= gridEdgeX && mouseX < gridEdgeX+40 && 
      mouseY >= gridEdgeY+80 && mouseY < gridEdgeY+120) {
        return "cornerBL";
    } else if(mouseX >= gridEdgeX+40 && mouseX < gridEdgeX+80 && 
      mouseY >= gridEdgeY+80 && mouseY < gridEdgeY+120) {
        return "wallB";
    } else if(mouseX >= gridEdgeX+80 && mouseX < gridEdgeX+120 && 
      mouseY >= gridEdgeY+80 && mouseY < gridEdgeY+120) {
        return "cornerBR";
     } else return null;    
  }  
  
}
