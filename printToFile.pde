/**
*printTofile.pde
*Outputs 8x8x16 array to 16 eight character wide, eight line long textfiles.
*
*@author Daniel Ingrey
*@version 1.0
*/
class FilePrint {
  String name; //name of section
  String line ; //used for conversion of an integer array row to 8 character long strings
  PrintWriter output; //used to write strings to textfiles
  int[][][] arr; //variable to hold the 8x8x16 array
  
  /**
   * Constructor for the FilePrint class.
   */
  FilePrint() { }
  
  /**
   * Function for creating textfiles from array input. 
   *
   * @param n        the name of the section type, held as a string.
   * @param section  the completed 8x8x16 section array.
   */
  void createFile(String n, int[][][] section) {
    name = n;
    arr = section;
    
    for(int i = 0; i < 16; i++) { 
     output = createWriter(name + i + ".txt"); //create a textfile for each 8x8 layer (16 textfiles per section in total)      
     for(int j = 0; j < 8; j++) {
       line = ""; //initialise string to be empty
       for(int k = 0; k < 8; k++) {
         line += arr[i][j][k]; //convert a row of the integer array to an 8 character string
       }       
       output.println(line); //print each 8 character string followed by carriage return to textfile
     }
     output.flush();
     output.close(); 
    }
  }
}
