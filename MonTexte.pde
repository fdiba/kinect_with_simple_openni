/* --------------------------------------------------------------------------
* SimpleOpenNI Training Course
* --------------------------------------------------------------------------
* Processing Wrapper for the OpenNI/Kinect 2 library
* http://code.google.com/p/simple-openni
* --------------------------------------------------------------------------
* prog:  Florent Di Bartolo / Interaction Design / UPEM / http://webodrome.fr/
* date:  12/02/2013 (m/d/y)
* ----------------------------------------------------------------------------
*/

class MonTexte{
  
  String str;
  color couleur;
  PFont font;
  
  MonTexte(){
    
    str = "Hello World!";
    couleur = color(0);
    font = loadFont("BookAntiqua-Italic-22.vlw");
    
    
  }
  void display(){
    textFont(font, 22);
    fill(couleur);
    text(str, 20, height/2); 
    
  }
  void update(String _str){
    str = _str;
  }
}
