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

class Btn{
  
  float x, y;
  int width, height;
  int alpha;
  color couleur;
  int id;
  int speed;
  
  Btn(float _x, float _y, int _width, int _height, color _couleur, int _id){
    
    x = _x;
    y = _y;
    width = _width;
    height = _height;
    alpha = 0;
    couleur = _couleur;
    id = _id;
    speed = 5;
  }
  void editSpeed(int _speed){
    speed = _speed;
  }
  void display(){
    stroke(0);
    fill(couleur, alpha);
    rect(x, y, width, height);
    
  }
  void isHit(){
    
    if(alpha<255){
      alpha+= speed;
    } else if (alpha>=255){
     
      //println("new event");
      console.updateMessage(str(id));
      console.testCombinaison();
      alpha = 0; 
      
    }
  
    
  }
  void isNotHit(){
    
    if(alpha>0)alpha--;
    
  }
}
