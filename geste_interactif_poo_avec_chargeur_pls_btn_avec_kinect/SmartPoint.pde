class SmartPoint{
    
  //PVector position;
  
  int maxValue;
  int closestValue;
  
  PVector lastLocation;
  PVector currentLocation;
  
  SmartPoint(){
  
    //position = new PVector(0, 0);
    
    maxValue = 1000;
    lastLocation = new PVector(0, 0);
    currentLocation = new PVector(0, 0);
  
  }
  void display(){
    noStroke();
    fill(255, 0, 0);
    //ellipse(position.x, position.y, 20, 20);
    ellipse(lastLocation.x, lastLocation.y, 30, 30);
  }
  void update(){
    
    //position.x = mouseX;
    //position.y = mouseY;
    
    closestValue = maxValue;
    
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
    println(lastLocation.x+ " "+ lastLocation.y);
    
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
