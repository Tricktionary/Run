class Enemy{
  int ex;
  int ey;
  float speed;
  int mode = 1;
  int timer =  timer=50+int(random(0,25)); //timer to switch mode 
  AudioPlayer scream;
 
  
  public Enemy(){
      ex = (int)random(40,400);
      ey = (int)random(100,200);
      speed = 2.5 ;
      scream = minim.loadFile("scream.mp3");
   }
   //boss
  public void enemyUpdate(float px,float py){
    timer--;
    if(timer==0)//when timer runs out, switch the mode and reset timer
    {
      mode=round(random(1,2)); //change when new modes are added;
      timer=25+int(random(0,25));
      if(mode == 1){
        timer+=50;
      }
    }
    if(mode == 1){ //Chases Player
      enemyMove(px,py,8);
    } 
    else if (mode == 2){
       stall(px,py);
    }
    else if(mode == 3){
      enemyMultiply();
      scream.play();
      scream.rewind();
    }
    
    
  }
  
  public void enemyUpdate(float px,float py,int doorX,int doorY,int stage){
    timer--;
    //System.out.println(timer);
    if(timer<=0)//when timer runs out, switch the mode and reset timer
    {
      mode=round(random(1,4)); //change when new modes are added;
      if(mode == 1){//chase
        timer = 100;
      }
      if(mode == 2){//door
        timer = 50;
      } 
      if(mode == 3){//spazz
        timer = 35; 
      }
      if(mode == 4){//mirage
        timer = 75;
      }
      //timer=100+int(random(10,15));
 
    }
    if (mode == 1){  //Waits at Door
      enemyMove(px,py,stage);
    } 
    else if(mode == 2){ //Chases Player
      enemyDoor(doorX,doorY);
    } 
    else if(mode == 3){
      enemyMultiply();
      
    }
    else if(mode == 4){
      mirage(px,py,stage);
    }
   
    
  }
  
  public void enemyMove(float px,float py,int stage){
   
    float dX, dY, norm;
     dX = px - ex;
     dY = py - ey;
     norm = sqrt((dX*dX)+(dY*dY));
     if (stage>=6){
       stage = 6;
     }
     ex+=((dX/norm)*(speed+stage*0.5));
     ey+=((dY/norm)*(speed+stage*0.5));  
            
     if(ex >= 880){
        ex = 880;
     }
     if(ex <=20){
        ex = 20;
     }
     if(ey <= 70){
        ey = 70;
     }
     if(ey >= 480){
        ey = 480;
     }
   } 
 
  
  public void enemyDoor(int doorX,int doorY){
     float dX, dY, norm;
     dX = doorX - ex;
     dY = doorY - ey;
     norm = sqrt((dX*dX)+(dY*dY));
 
     ex+=((dX/norm)*(speed+7));
     ey+=((dY/norm)*(speed+7)); 
     if(ex >= 880){
        ex = 880;
     }
     if(ex <=20){
        ex = 20;
     }
     if(ey <= 70){
        ey = 70;
     }
     if(ey >= 480){
        ey = 480;
     }
    
  }
  
  public void enemyMultiply(){
    fill(128,0,128);
    float dX, dY, norm;
    dX = (int)random(40,800) - ex;
    dY = (int)random(100,450)- ey;
    norm = sqrt((dX*dX)+(dY*dY));
 
     ex+=((dX/norm)*(speed+7));
     ey+=((dY/norm)*(speed+7)); 
     if(ex >= 880){
        ex = 880;
     }
     if(ex <=20){
        ex = 20;
     }
     if(ey <= 70){
        ey = 70;
     }
     if(ey >= 480){
        ey = 480;
     }
 
  }
  
  public void mirage(float px,float py,int stage){
    fill(128,0,128);
    ellipse((int)random(40,890),(int)random(80,450),20,20);
    ellipse((int)random(40,890),(int)random(80,450),20,20);
    ellipse((int)random(40,890),(int)random(80,450),20,20);
    ellipse((int)random(40,890),(int)random(80,450),20,20);
     float dX, dY, norm;
     dX = px - ex;
     dY = py - ey;
     norm = sqrt((dX*dX)+(dY*dY));
 
     ex+=((dX/norm)*(speed+stage*0.7));
     ey+=((dY/norm)*(speed+stage*0.7));  
            
     if(ex >= 880){
        ex = 880;
     }
     if(ex <=20){
        ex = 20;
     }
     if(ey <= 70){
        ey = 70;
     }
     if(ey >= 480){
        ey = 480;
     }
  }
   public void stall(float px,float py){
    fill(128,0,128);
 
     float dX, dY, norm;
     dX = px - ex;
     dY = py - ey;
     norm = sqrt((dX*dX)+(dY*dY));
 
     ex+=((dX/norm)*(speed+3 ));
     ey+=((dY/norm)*(speed+3 ));  
            
     if(ex >= 880){
        ex = 880;
     }
     if(ex <=20){
        ex = 20;
     }
     if(ey <= 70){
        ey = 70;
     }
     if(ey >= 480){
        ey = 480;
     }
  }
 
 
    
  public void drawEnemy(){
      fill(128,0,128);
      ellipse(ex,ey,20,20);
      //System.out.println(mode);
      
   }   
  
  
  
}
