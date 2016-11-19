class Door{
  int doorX;
  int doorY;
  int doorW;
  int doorH;
  
  public Door(int side){
    //top
      if(side == 1){
        //rect((int)random(0,700),5,20,5);
        doorX = (int)random(20,600);
        doorY = 50;
        doorW = 30;
        doorH = 10;
      }
      //left
      if(side == 2){
        //rect(0,(int)random(0,400),10,20);
        doorX = 0 ;
        doorY = (int)random(60,450);
        doorW = 10;
        doorH = 30;
      }
      //bottom
      if(side == 3){
        //rect((int)random(0,700),480,20,5);
        doorX = (int)random(20,600);
        doorY = 490;
        doorW = 30;
        doorH = 15;
      }
      //right
      if(side == 4){
        //rect(880,(int)random(0,400),5,20);
        doorX = 890;
        doorY = (int)random(60,450);
        doorW = 15;
        doorH = 30;
      }
  }
  public boolean doorHit(float px,float py,int side){
    boolean hit = false;
    if(side==1){
       if((px>=doorX)&&(px<doorX+doorW)){
         if(py<=80){
            hit = true;

         }
       }
     }
     //left 
     if(side==2){
       if((py>=doorY)&&(py<=doorY+doorH)){
         if(px<=30){
           hit = true;

         }
       }
     }
     //bottom
     if(side==3){
       if((px>=doorX)&&(px<doorX+doorW)){
         if(py>=470){
           hit = true;

         }
       }
     }
     //right
     if(side==4){
       if((py>=doorY)&&(py<=doorY+doorH)){
         if(px>=870){
           hit = true;

         }
       }
     }
     return(hit);
  }
}
