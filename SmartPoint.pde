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

class SmartPoint{
    
  int maxValue;
  int closestValue;
  
  PVector currentLocation; //closest point current location
  PVector lastLocation; //sp last position
  PVector oldLocation; //sp old location
  
  SmartPoint(){
    
    maxValue = 1000;
    lastLocation = new PVector(0, 0);
    currentLocation = new PVector(0, 0);
    oldLocation = new PVector(0, 0);
  
  }
  void display(){
    noStroke();
    fill(255, 0, 0);
    //ellipse(position.x, position.y, 20, 20);
    ellipse(lastLocation.x, lastLocation.y, 30, 30);
  }
    void distance(){
   
   stroke(0, 255, 0);
   strokeWeight(3);
   line(oldLocation.x, oldLocation.y, lastLocation.x, lastLocation.y);
   
   float distance = dist(oldLocation.x, oldLocation.y, lastLocation.x, lastLocation.y);
   //println(distance);
   
   if(distance > 60){
     
     //println(distance);
     String str="";
     
     if(oldLocation.x > lastLocation.x + 30) {
     
       //println("left");
       str = "direction left " + distance;
       
       
       
     } else if (oldLocation.x < lastLocation.x + 30){
       
       //println("right");
       str = "direction right " + distance;
     }
     monTexte.update(str);
   }
   
  }
  void update(){
    
    closestValue = maxValue;
    oldLocation.x = lastLocation.x;
    oldLocation.y = lastLocation.y;
    
    int[] depthValues = openni.depthMap();
    int mapWidth = openni.depthWidth();
    int mapHeight = openni.depthHeight();
    
    for(int y = 0; y < mapHeight; y++){
      for(int x = 0; x < mapWidth; x++){
        int i = x + y * mapWidth;
        int currentDepthValue = depthValues[i];
        if(currentDepthValue > 0 && currentDepthValue < closestValue){
          closestValue = currentDepthValue;
          currentLocation.x = x;
          currentLocation.y = y;
        }
      }
    }
    
    lastLocation.x = (lastLocation.x + currentLocation.x) / 2;
    lastLocation.y = (lastLocation.y + currentLocation.y) / 2;    
  }  
  boolean hitTarget(Btn btn){
    
    if(lastLocation.x > btn.x && lastLocation.x < btn.x + btn.width &&
       lastLocation.y > btn.y && lastLocation.y < btn.y + btn.height){
      return true; 
    } else {
      return false; 
    }
  }
}
