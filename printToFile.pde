/**
*
*
*/
class FilePrint {
  String name;
  String line ;
  PrintWriter output;
  int[][][] arr;
  FilePrint() { }
  
  void createFile(String n, int[][][] section) {
    name = n;
    arr = section;
    
    for(int i = 0; i < 16; i++) {
     output = createWriter(name + i + ".txt");       
     for(int j = 0; j < 8; j++) {
       line = "";
       for(int k = 0; k < 8; k++) {
         line += arr[i][j][k];
       }       
       output.println(line);
     }
     output.flush();
     output.close(); 
    }
  }
}
