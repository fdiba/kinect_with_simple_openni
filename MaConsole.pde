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

class MaConsole {

  String message;
  float x, y;
  color couleur;
  PFont font;

  MaConsole(float _x, float _y) {
    x = _x;
    y = _y;
    message = "";
    couleur = color(0, 102, 153);
    font = loadFont("CenturyGothic-32.vlw");
    
  }
  void display() {
    textFont(font, 32);
    fill(couleur);
    text(message, x, y);
  }
  void resetMessage(){
    message = "";
    
  }
  void updateMessage(String _str) {

    String lastCharacter = "";

    if (message.length() > 0) {
      lastCharacter = message.substring(message.length()-1);
    }

    if (lastCharacter.equals(_str)) {
      //println("dernière zone activée");
    } 
    else {

      message = message + _str;
    }
  }
  void testCombinaison() {

    if(message.equals("123")) {
      makeSomeNoise("kick.wav");
      resetMessage();
    } else if (message.equals("121")){
      monTexte.update("A quick brown fox jumps over the lazy dog.");
      resetMessage();
    } else if (message.equals("321")){
      
      if(myMovie.time() == myMovie.duration()){
        myMovie.jump(0);
      }
      
      myMovie.play();
      resetMessage();
    }
  }
}

