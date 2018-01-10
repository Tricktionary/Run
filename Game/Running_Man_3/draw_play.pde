//--------------------------------------------------------DRAW-GAME-------------------------------------------------------------------------------------------- 
int gold;
int lives;
int stage = 1;
boolean  intro = true, set = false, game = false;
int side;
int speedCounter = 1;
boolean key_up, key_down, key_left, key_right;
boolean choice = false;
int wutMiniGame = 0;
Coin[] coin = new Coin[10];
int r;
int g;
int b;
Door door;
Player p;
Enemy  e;
Notes  notes;
void draw_play()
{   
    if(intro == true){
      background(0);
      text("Where Am I ?",300,250);
      text("It's Chasing Me... ",500,150);
      text("Who Am I?",100,99);
      text("He's here",700,200);
      text("What is This ?",600,320);
      text("Press N to continue",600,450);
      stage = 1;
      key_up = false;
      key_down = false;
      key_left = false;
      key_right = false;
    }
//--------------------------------------------------------------------------------------------------------    
    //sets next stage
    if(set == true){
      notes = new Notes();
      miniGameMusic.pause();
      miniGameMusic.rewind();
      amb.play();
      side =(int)random(1,5);
      
      for(int i = 0; i < 10 ;i++){
        coin[i] = new Coin();
      }
      r = (int)random(1,255);
      g = (int)random(1,255);
      b = (int)random(1,255);
      door = new Door(side);
      p    = new Player();
      e    = new Enemy();
      set = false;
      obstaclesLeft = 10;
    }
    
   if(game == true){
   //System.out.println(speedCounter);
      
      background(10,10,10); 
      image(background,0,0);
//--------------------------------Hit Detection---------------------------------------------------------------------------------     
     //coins 
     for(int i = 0; i < 10 ;i++){
        coin[i].coinDraw();
        if(coin[i].coinHit(p.px,p.py)==true){
          gold++;
          //stage = 20;
        }
     } 
    //note book 
    if(noteBookCount<6){
      if(notes.display == true){
          notes.display(); 
      }
      if(notes.noteHit(p.px,p.py) == true){
         notes.display = false; 
         noteBookCount++;
         //System.out.println(noteBookCount);
      }
   }
    //door hit detection
    if(door.doorHit(p.px,p.py,side)==true){
      choice = true;
      if(choice == true){
       wutMiniGame ++;
       if( wutMiniGame >= 5){
          wutMiniGame = 1; 
       }
       choice = false; 
      }
      if(wutMiniGame == 1){
        gameState = MINIGAME1;
      }
      if(wutMiniGame == 2){
        gameState = MINIGAME2;
      }
      if(wutMiniGame == 3){
        gameState = MINIGAME3;
      }
      if(wutMiniGame == 4){
        gameState = MINIGAME4;
      }
      set = true;
      stage++;
      game = false;
      key_up = false;
      key_down = false;
      key_left = false;
      key_right = false;
    }
      
     //player and running man hit detection
     //players and enemy are 20 by 20 
     if(p.playerHitEnemy(e.ex,e.ey)==true){
         p    = new Player();
         e    = new Enemy();
         lives--;
         gold=gold-5;
         if(gold<=0){
           gold = 0;
         }
     }
//---------Movement=----------------------------------------------------------------------------------------------------
     //Player
     p.playerMove(key_up,key_down,key_left,key_right,speedCounter);
     p.drawPlayer();      
     //Enemy
     e.enemyUpdate(p.px,p.py,door.doorX,door.doorY,stage);
     //e.enemyMove(p.px,p.py,stage);
     e.drawEnemy();
      
     //hud
     fill(255);
     rect(0,0,900,50);
     fill(0);
     textSize(20);
     text("STAGE :"+ stage,395,40);
     text("LIVES :"+ lives,750,40);
     text("GOLD :"+ gold,15,40);
        
     //900 by 500
     //creating walls 
     fill(r,g,b);
     //top
     rect(0,0,900,10);
     rect(0,50,900,10);
     //bottom
     rect(0,490,900,10);
     //left
     rect(0,0,10,500);
     //right
     rect(890,0,10,500);
     //creating door
     fill(255,165,0);
     //door
     rect(door.doorX,door.doorY,door.doorW,door.doorH);
     
     //End of The game 
     if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 0; 
       speedCounter = 1;
       game = false;
       } 
       
     if(stage>10){
       gameState = BOSSFIGHT;
       intro = true;
       lives = 5;
       gold = 0; 
       //  speedCounter = 10;
       game = false;
     }
    }    
}
