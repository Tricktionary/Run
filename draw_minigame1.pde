//Jumping over obstacles;
//-----------------------------------------------------------MiniGame1-----------------------------------------------------------------------
boolean struct1 = true;
boolean start1 = false;
int p1x = 450;
int p1y = 400;
Mini1GameBox[] minibox = new Mini1GameBox[3];
int speed1 = 0;
int jump1 = -6;
int gravity1 = 1;
int obstaclesLeft = 10; 
 
void draw_minigame1(){
   background(0);
   //amb.pause(); // Pause Ambiance
   //miniGameMusic.play(); //Play mini music
   //Gives plater minigame instructions
   if(struct1 == true){
       image(instruct1,0,0);
       minibox[0] = new Mini1GameBox(900,350,-11,-3);
       minibox[1] = new Mini1GameBox(1200,350,-11,0);
       minibox[2] = new Mini1GameBox(1500,250,-11,-3);  
   }

   //Starts the minigame 
   if(start1 == true){
     jump1 = jump1 + gravity1;  
     p1y = p1y +jump1; 
     if(p1y>=400){
       p1y = 400;
     }  
     //snow
     for(int z= 0; z<60; z++){
      fill(255);
      if(snowY[z] >= 500)
      snowY[z]=0;
      if(snowX[z]<0){
        snowX[z] = 900;
      }
      ellipse(snowX[z]--, snowY[z]+=(int)random(1,3),5,5);
    }
    
     //Ground
     fill(255);
     rect(0,410,900,100);
     //Chaser
     //fill(128,0,128);
     //ellipse(10,400,20,20);
     //hud
     fill(255);
     rect(0,0,900,50);
     fill(0);
     textSize(20);
     text("OBSTACLES LEFT :"+ obstaclesLeft,375,40);
     text("LIVES :"+ lives,750,40);
     text("GOLD :"+ gold,15,40);
     fill(84,84,84);
     //top
     rect(0,0,900,10);
     rect(0,50,900,10);
     
   
      if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 0; 
       speedCounter = 1;
       game = false;
       obstaclesLeft = 10;
       struct1 = true;
       start1 = false;
       stage = 0;
      } 
     //obstacle
     for(int i = 0; i <3 ; i++){
       minibox[i].resetY();
       minibox[i].boxDraw();
       if(minibox[i].resetX() == true){
           obstaclesLeft--;
       }
       if(minibox[i].boxhit(p1x,p1y) == true){
         lives--;
         minibox[0] = new Mini1GameBox(900,350,-11,-3);
         minibox[1] = new Mini1GameBox(1200,350,-11,0);
         minibox[2] = new Mini1GameBox(1500,250,-11,-3);  
         speed1 = 0;
         p1x = 400;
       }
     }
     
     fill(128,0,128);  
     //Player Movement 
     p1x =p1x + speed1;
     
     //Borders
     if(p1x<=50){
       p1x=50;
     }
     if(p1x>=900){
       p1x = 900;
     }
     
     //player
     fill(255);
     ellipse(p1x,p1y,20,20);
 
    
    //end of minigame
    if(obstaclesLeft<=0){
       gameState = SHOP;
       obstaclesLeft = 10;
       struct1 = true;
       start1 = false;
       gold +=20;
 

    }
   }
}
