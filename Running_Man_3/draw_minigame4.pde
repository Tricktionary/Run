boolean struct4 = true;
boolean start4 = false;
Player p4 = new Player(450,200);
boolean key_up4, key_down4, key_left4, key_right4;
int numBullets =  15;
Bullet[] bullets4 = new Bullet[numBullets];
//Bullet testBullet = new Bullet(1);
int timer4 = 1000;
//----------------DODGE THE BULLETS-----------------------------------------------------------------
void draw_minigame4(){
   //amb.pause(); // Pause Ambiance
   //miniGameMusic.play(); //Play mini music
  if (struct4 == true){
    
    background(0);
    image(instruct4,0,0);
    for(int i = 0; i<numBullets ; i++){
       bullets4[i] = new Bullet((int)random(0,5)); 
     }  
  }
    
  if(start4 == true){
     background(0);
     //The players box
     fill(255);
     rect(210,100,485,275);
     fill(0);
     p4.drawPlayer();  
     p4.playerMove(key_up4, key_down4, key_left4, key_right4,5);  
     if(p4.px<220){
       p4.px = 220;
     }
     if(p4.px>685){
       p4.px = 685;
     }
    if(p4.py<110){
       p4.py = 110;
     }
    if(p4.py>365){
       p4.py = 365;
    }
    
    for(int i = 0; i<numBullets ; i++){ 
        bullets4[i].bulletMove();
        bullets4[i].drawBullet();
        if(bullets4[i].expiredBullet() == true){
           bullets4[i] = new Bullet((int)random(0,5)); 
        }
        if(p4.playerHitEnemy(bullets4[i].x,bullets4[i].y) == true){
           lives--;
           for(int k = 0; k<numBullets ; k++){
             bullets4[k] = new Bullet((int)random(0,5)); 
            }
           p4 = new Player(450,200);   
        }
    }
     timer4--;
     if(timer4<=0){
        timer4 = 1000; 
        struct4 = true;
        start4 = false;
        gameState= SHOP;
        gold+=20;
        key_up4 = false;
        key_down4 = false;
        key_left4 = false;
        key_right4 = false;
     }
     if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 0; 
       speedCounter = 1;
       game = false;
       obstaclesLeft = 20;
       struct1 = true;
       start1 = false;
       stage = 0;
      } 
     //hud
     fill(255);
     rect(0,0,900,50);
     fill(0);
     textSize(20);
     text("TIMER :"+ timer4,340,40);
     text("LIVES :"+ lives,750,40);
     text("GOLD :"+ gold,15,40);
     fill(84,84,84);
     //top
     rect(0,0,900,10);
     rect(0,50,900,10);
 
  }
 
}
