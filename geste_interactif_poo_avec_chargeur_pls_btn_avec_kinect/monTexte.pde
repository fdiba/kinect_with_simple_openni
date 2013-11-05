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
