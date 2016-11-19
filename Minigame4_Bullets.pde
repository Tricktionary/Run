class Bullet{
  int x;
  int y;
  int moveSpeed;
  int lifespan ;
  int spot;
 
 
  //210,100,485,275
  public Bullet(int spot){
    //top
      if(spot == 1){
        this.x = (int)random(210,685);
        this.y = 50;
        this.moveSpeed= (int)random(4,7);
        this.lifespan = 400;
        this.spot = 1;
      }
      //left
      if(spot == 2){
        this.x =  0 ;
        this.y = (int)random(100,375);
        this.moveSpeed = (int)random(3,6);
        this.lifespan = 300;
        this.spot = 2;
      }
      //bottom
      if(spot == 3){
        this.x = (int)random(210,685);
        this.y = 490;
        this.moveSpeed = - (int)random(2,6);
        this.lifespan = 300;
        this.spot = 3;
      }
      //right
      if(spot == 4){
        this.x =  890;
        this.y = (int)random(100,375);
        this.moveSpeed = -(int)random(5,8);
        this.lifespan = 300;
        this.spot = 4;
      }
    }
    
    public Bullet(int spot,int type2){
    //top
      if(spot == 1){
        this.x = (int)random(0,900);
        this.y = -20;
        this.moveSpeed= (int)random(2,6);
        this.lifespan = 300;
        this.spot = 1;
      }
      //left
      if(spot == 2){
        this.x =  -20;
        this.y = (int)random(100,500);
        this.moveSpeed = (int)random(2,6);
        this.lifespan = 300;
        this.spot = 2;
      }
      //bottom
      if(spot == 3){
        this.x = (int)random(0,900);
        this.y = 520;
        this.moveSpeed = - (int)random(2,6);
        this.lifespan = 300;
        this.spot = 3;
      }
      //right
      if(spot == 4){
        this.x =  920;
        this.y = (int)random(100,400);
        this.moveSpeed = -(int)random(2,6);
        this.lifespan = 400;
        this.spot = 4;
      }
    }
  public void bulletMove(){
    if(this.spot == 1){
      this.y += moveSpeed;  
    }
    if(this.spot == 2){
      this.x += moveSpeed;  
    }
    if(this.spot == 3){
      this.y += moveSpeed;  
    }
    if(this.spot == 4){
      this.x += moveSpeed;  
    }    
  }
  
  public void drawBullet(){
     fill(255,0,0);
     ellipse(x,y,10,10);            
   }
 
  public boolean expiredBullet(){
      lifespan -- ;
      if (lifespan<=0){
         return(true); 
      }
      return(false);
   }
    
}

