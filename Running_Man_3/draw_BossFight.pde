boolean key_upB,key_downB,key_leftB,key_rightB ;
Player pb;
Enemy boss;
boolean bossSet = true;
boolean bossStart = false;
int startTime = 0;
Fire[] fire = new Fire[13];
int rmHP = 13;

public void draw_BossFight(){
//lead the monster into fire
     if(bossSet == true){
        amb.pause();; // Pause Ambiance
        miniGameMusic.play(); //Play mini music
        key_upB = false;
        key_downB = false;
        key_leftB = false;
        key_rightB = false;
        pb = new Player(450,200); ;
        boss  = new Enemy();
        image(instructBoss,0,0);
        //bullets
        numBullets = 14;
        for(int i = 0; i<numBullets ; i++){
         bullets4[i] = new Bullet((int)random(0,5)); 
        }
        //fire
        for(int i = 0; i < 13 ;i++){
          fire[i] = new Fire();
        }
       
     }
    
     if(bossStart == true){ 
 
 
       background(10,10,10); 
       image(background,0,0);
        
       pb.playerMove(key_upB,key_downB,key_leftB,key_rightB,speedCounter);
       pb.drawPlayer();
       boss.drawEnemy(); 
       for(int i = 0; i < 13 ;i++){
          fire[i].fireDraw();
       }
       startTime++;
       if (startTime> 110){
          startTime = 110; 
       }
       if(startTime>100){
         boss.enemyUpdate(pb.px,pb.py);
          
         for(int i = 0; i<numBullets ; i++){ 
          bullets4[i].bulletMove();
          bullets4[i].drawBullet();
          if(bullets4[i].expiredBullet() == true){
             bullets4[i] = new Bullet((int)random(0,5),3); 
          }
          if(pb.playerHitEnemy(bullets4[i].x,bullets4[i].y) == true){
             lives--;
             for(int k = 0; k<numBullets ; k++){
               bullets4[k] = new Bullet((int)random(0,5),3); 
              }
             pb = new Player(450,200);
             boss = new Enemy();   
             startTime = 0;
          }
      }
         for(int i = 0; i < 13 ;i++){
          if(fire[i].fireHit(boss.ex,boss.ey)==true){
             rmHP --;
             boss.mode=3;
             boss.timer = 20;
          }
       } 
       if(pb.playerHitEnemy(boss.ex,boss.ey)==true) {
           pb = new Player(450,200);
           boss = new Enemy();  
           lives--; 
           startTime = 0;
           for(int k = 0; k<numBullets ; k++){
               bullets4[k] = new Bullet((int)random(0,5),3); 
            }
         } 
     //hud
       }
       fill(255);
       rect(0,0,900,50);
       fill(0);
       textSize(20);
       text("LIVES :"+ lives,750,40);
       text("RM HP:"+ rmHP,15,40);
 
       //creating walls 
       fill(0);
       //top
       rect(0,0,900,10);
       rect(0,50,900,10);
       //bottom
       rect(0,490,900,10);
       //left
       rect(0,0,10,500);
       //right
       rect(890,0,10,500);
 
     if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 10; 
       speedCounter = 1;
       game = false;
       rmHP = 10;
       bossSet = true;
       bossStart = false;
       startTime = 0;
       } 
     if (rmHP<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 10; 
       speedCounter = 1;
       game = false;
       rmHP = 10;
       win = true;
       bossSet = true;
       bossStart = false;
       startTime = 0;
       } 
      
//-----------------------------------------------------------------------------   
     }
     
     
}
