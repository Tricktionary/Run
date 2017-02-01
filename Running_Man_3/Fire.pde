class Fire {
    int fireX;
    int fireY;
    boolean fireDisplay;
    PImage fires; 
 
    AudioPlayer bading;
 
    public Fire(){
        fireX = (int)random(50,850);
        fireY = (int)random(100,400);
        fireDisplay = true;  
        fires  = loadImage("fire.png");
        //bading = minim.loadFile("bading.mp3");
 
    }
    
    public void fireDraw(){
      if(fireDisplay == true){
          image(fires,fireX,fireY);
            
      }  
     frameRate(60); 
    }
    
    public boolean fireHit(float px, float py){
       if(fireDisplay == true){ 
          if(((fireX>=px)&&(fireX<=px+25))||((fireX+25>=px)&&(fireX+25<=px+25))){
             if(((fireY>=py)&&(fireY<=py+25))||((fireY+25>=py)&&(fireY+25<=py+25))){
                  fireDisplay= false;
                  //bading.play();
                  return(true);
          }  
        }
      }
      return(false);
    }
}
