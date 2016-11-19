class Coin {
    int coinX;
    int coinY;
    boolean coinDisplay;
    PImage coins; 
 
    AudioPlayer bading;
 
    public Coin(){
        coinX = (int)random(50,850);
        coinY = (int)random(100,400);
        coinDisplay = true;  
        coins  = loadImage("coin1.png");
        bading = minim.loadFile("bading.mp3");
 
    }
    
    public void coinDraw(){
      if(coinDisplay == true){
          image(coins,coinX,coinY);
            
      }  
     frameRate(60); 
    }
    
    public boolean coinHit(float px, float py){
       if(coinDisplay == true){ 
          if(((coinX>=px)&&(coinX<=px+25))||((coinX+25>=px)&&(coinX+25<=px+25))){
             if(((coinY>=py)&&(coinY<=py+25))||((coinY+25>=py)&&(coinY+25<=py+25))){
                  coinDisplay= false;
                  bading.play();
                  return(true);
          }  
        }
      }
      return(false);
    }
}
