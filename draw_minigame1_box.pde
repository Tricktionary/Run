class Mini1GameBox{
  int x;
  int y;
  int moveY;
  int moveX;
   
   public Mini1GameBox (int x, int y, int moveX, int moveY){
        this.x = x ;
        this.y = y ; 
        this.moveX = moveX;
        this.moveY = moveY;
    }
   
   
   public boolean boxhit(int p1x, int p1y){
         if((( p1x>=x)&&( p1x<=x+60 ))||(( p1x+13 >= x )&&( p1x+13 <= x+60 ))){
           if((( p1y >= y )&&(  p1y<=y+60  ))||(( p1y+13 >= y )&&(  p1y+13<=y+60  ))){
             return(true);         
             }
          }
       return(false);
      }
      
    public void resetY(){
      y += moveY; 
        if(moveY != 0){  
           if(y>=350){
             this.moveY=-3;
           }
           if(y <250){
             this.moveY=3; 
            }
         }  
      }
    
    public boolean resetX(){
     x += moveX;
     if(x<-100){
        x = 900;
        return(true);
       }
      return(false); 
    }
     
    public boolean minusObstacles(){
       if (x<=-80){
         x = 900;
         return(true);
       } 
      return(false);
    }
    
    public void boxDraw(){
      fill(128,0,128);   
      rect(x,y,60,60); 
    }
  }  
  

