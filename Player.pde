class Player{
    float px;
    float py;
    float vx;
    float vy;
    
    public Player(){
      px = (int)random(500,890);
      py = (int)random(200,490); 
      vx = 0;
      vy = 0;
    }
    
    public Player(int x, int y){
      px = x;
      py = y; 
      vx = 0;
      vy = 0;
    }
//Check if the player gets hit 
     public boolean playerHitEnemy(float ex,float ey){
       if(((ex>=px)&&(ex<=px+20))||((ex+20>=px)&&(ex+20<=px+20))){
         if(((ey>=py)&&(ey<=py+20))||((ey+20>=py)&&(ey+20<=py+20))){
           return(true);  
         }
       }
       return(false);
     }
//Gets The Players Movements
     public void playerMove(boolean key_up, boolean key_down, boolean key_left, boolean key_right,int speedCounter){
        //player Movement
        if(key_up == false){
           vy = 0;
        }
        if(key_down == false){
           vy = 0;
 
        }
        if(key_left == false){
          vx = 0 ;
 
        }
        if(key_right == false ){
          vx = 0 ;
        }
        if(key_up == true){
           vy = (-3.4-(speedCounter*0.10));
 
        }
        if(key_down == true){
           vy = (3.4+(speedCounter*0.10));
 
        }
        if(key_left == true){
          vx = (-3.4-(speedCounter*0.10)) ;
        }
        if(key_right == true ){
          vx = (3.4+(speedCounter*0.10)) ;
        }
        
        px = px + vx;
        py = py + vy;
        
        //player Bounderies
        if(px >= 880){
           px = 880;
        }
        if(px <=20){
           px = 20;
        }
        //top
        if(py <= 70){
           py = 70;
        }
        if(py >= 480){
          py = 480;
        }
      }
   public void drawPlayer(){
        fill(255,255,255);
        ellipse(px,py,20,20);
      
      }   
 }

