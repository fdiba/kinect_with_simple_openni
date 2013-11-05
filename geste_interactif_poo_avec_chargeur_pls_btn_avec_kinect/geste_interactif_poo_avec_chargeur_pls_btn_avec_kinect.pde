import SimpleOpenNI.*;
import ddf.minim.*;
import processing.video.*;

SimpleOpenNI openni;
Movie myMovie;

Minim minim;
AudioSnippet player;

SmartPoint sp;
MaConsole console;

Btn btn1;
Btn btn2;
Btn btn3;

MonTexte monTexte;

void setup(){
 size(640, 480);
 
 openni = new SimpleOpenNI(this);
 openni.enableDepth();
 openni.setMirror(true);
 
 sp = new SmartPoint();
 console = new MaConsole(30, 50);
 
 btn1 = new Btn(width-100, 10, 80, 80, color(255, 0, 0), 1);
 btn2 = new Btn(width-100, 110, 80, 80, color(0, 255, 0), 2);
 btn3 = new Btn(width-100, 210, 80, 80, color(0, 0, 255), 3);
 
 btn1.editSpeed(10);
 
 minim = new Minim(this);
 monTexte = new MonTexte();
 
 myMovie = new Movie(this, "test.mov");
 
 
}
void movieEvent(Movie m){
  m.read(); 
}
void makeSomeNoise(String _str){
    
  player = minim.loadSnippet(_str);
  
  if(!player.isPlaying()){
    player.rewind();
    player.pause();
  }  
  
  player.play();
  
  
}
void mousePressed(){
  console.message = "";
  
}
void draw(){
  background(255);
  
  openni.update();
  tint(255, 120);
  image(openni.depthImage(), 0, 0);
  
  tint(255, 255);
  sp.update();
  
  console.display();
  
  btn1.display();
  btn2.display();
  btn3.display();
  
  monTexte.display();
  
  image(myMovie, 640-200, 480-160);
  
  sp.display();
  
  if(sp.hitTarget(btn1)){
    btn1.isHit(); 
  } else {
    btn1.isNotHit();
  }
  
  if(sp.hitTarget(btn2)){
    btn2.isHit(); 
  } else {
    btn2.isNotHit();
  }
  
  if(sp.hitTarget(btn3)){
    btn3.isHit(); 
  } else {
    btn3.isNotHit();
  }
  
}
