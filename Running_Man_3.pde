//Andy Bui 100997767 
//Austin Lee 101011590 
//Michael Norris 100997078 

import ddf.minim.*;
AudioPlayer amb;
AudioPlayer winTheme;
AudioPlayer miniGameMusic;

Minim minim;//audio context
//https://www.youtube.com/watch?v=SNeZWxrkWO0
//Wilheml scream
int gameState ; 
PImage in;
PImage shopping;
PImage instruct1;
PImage instruct2;
PImage instruct3;
PImage instruct4;

PImage instructBoss;
PImage background;
boolean win = false;
 

int MENU = 0;
int PLAY = 1;
int END  = 3;
int CREDITS = 4;
int INSTRUCTION = 5;
int SHOP = 6;
int MINIGAME1 = 7;
int MINIGAME2 = 8;
int MINIGAME3 = 9;
int MINIGAME4 = 10;
int BOSSFIGHT = 11;
int STORYREAD = 12;

PImage[] story = new PImage[6];
int noteBookCount;
void setup()
{
  //subject to change 
  lives = 5 ;
  //initial gold
  gold = 10;
  minim = new Minim(this);
  amb = minim.loadFile("file.mp3");
  winTheme = minim.loadFile("winTheme.mp3");
  miniGameMusic = minim.loadFile("miniGameMusic.mp3");
  noteBookCount = 0;
  gameState = MENU;
  size(900,500);
  snowX = new int[100];
  snowY = new int[100];
  // Snow
  for(int i = 0; i<100;i++){
    snowX[i] = (int)random(0,900);
    snowY[i] = (int)random(-500,0);
  }
  in = loadImage("instructions.jpg");
  shopping = loadImage("shop.jpg");
  instruct1 = loadImage("instruct1.jpg");
  instruct2 = loadImage("instruct2.jpg");
  instruct3 = loadImage("instruct3.jpg");
  background = loadImage("background.jpg");
  instruct4 = loadImage("instruct4.jpg");
  instructBoss = loadImage("instructBoss.jpg");
  
  story[0] = loadImage("note1.jpg");
  story[1] = loadImage("note2.jpg");
  story[2] = loadImage("note3.jpg");
  story[3] = loadImage("note4.jpg");
  story[4] = loadImage("note5.jpg");
  story[5] = loadImage("note6.jpg");
 
}
//-----------------------------------------------------------DRAWING-------------------------------------------------------------------------
void draw()
{
  if(gameState == MENU){
    draw_menu();
  }
  if(gameState == PLAY){
    draw_play();
  }
  if(gameState == END){
    draw_end();
  }
  if (gameState == CREDITS){
    draw_credits();
  }
  if (gameState == INSTRUCTION){
    draw_instruction();
  }
  if (gameState == SHOP){
    draw_shop();
  }  
  if (gameState == MINIGAME1){
    draw_minigame1();         
  }
  if (gameState == MINIGAME2){
    draw_minigame2();         
  }
  if (gameState == MINIGAME3){
    draw_minigame3();         
  }
  if (gameState == MINIGAME4){
    draw_minigame4();         
  }
  if (gameState == BOSSFIGHT){
    draw_BossFight(); 
  }
  if (gameState == STORYREAD){
    draw_story();
  }
  
}
//--------------------------------------------KEYPRESSED--------------------------------------------------------------------------------------------
void keyPressed()
{
  //------------MENU-----------------------------------------
    if (gameState == MENU){
      if((key == 'p')||(key == 'P'))
      {
        gameState =  PLAY;
      }
      if((key == 'c')||(key == 'C'))
      {
        moving_credits = 0;
        gameState = CREDITS;
      }
      if((key == 'I')||(key == 'i'))
      {
        gameState = INSTRUCTION;
      }
      //testing
      /*
     if(key == 'e'){
      gameState = END;
      stage = 20;
     } */
    }
//-----------------------PLAY-----------------------------------------------------
    if (gameState == PLAY){
      if(intro == true){
        if((key == 'n')||(key == 'N')){
          intro = false;
          set = true;
          game = true;
        }
        }
      if(game == true){
        switch(key) {
          case 'W': 
            key_up = true;
            break;
          case 'S':
            key_down = true;
            break;
          case 'A': 
            key_left = true;
            break;
          case 'D':
            key_right = true;
            break;
          case 'w': 
            key_up = true;
            break;
          case 's':
            key_down = true;
            break;
          case 'a': 
            key_left = true;
            break;
          case 'd':
            key_right = true;
            break;   
         }
        if((key == 'b')||(key == 'B')){
          set = true;
          stage++;
          wutMiniGame++;
          lives++;
          speedCounter+=2;
          if( wutMiniGame >= 5){
            wutMiniGame = 1; 
          }
          //gameState = SHOP;
          //game = false;
        }  
   
        if((key == 'm')||(key == 'M')){
          gameState = SHOP;
          game = false;
        }       
      }  
    }
//=================================================================================
  if(gameState == END){
    if((key =='n')||(key == 'N')){
      gameState = MENU; 
      transparency = 1;
      ENDmovement = 0;
      endLife = true;
    }
  }
//=================================================================================
  if(gameState == INSTRUCTION  ){
    if((key =='n')||(key == 'N')){
      gameState = MENU;
    }
  }
//=================================================================================
   if(gameState == SHOP){
     if((key == 'n')||(key == 'N')){
        gameState = PLAY;
        game = true;
      }
     if( ((key == 'r')||(key == 'R')) && (noteBookCount>0) ) {
       gameState = STORYREAD;
       readingCount=0;
      }
  }
   if(gameState == STORYREAD){
     if((key == 'n')||(key == 'N')){
        readingCount++;
      }
  }
//=================================================================================
  if(gameState == MINIGAME1){
  if(struct1 == true){
     if((key == 'n')||(key == 'N')){
       struct1 = false;
       start1 = true;
    }
  } 
  if(start1 == true){
    if((key == 'd')||(key == 'D')){
      speed1 =  4;
      }
    if((key == 'a')||(key == 'A')){
      speed1 = -5;
      }
    if(((key == ' '))&&(p1y==400)){
      jump1 = -15;
      }
    }
  }
//=================================================================================
  if(gameState == MINIGAME2){
    if(struct2 == true){
        if((key == 'n')||(key == 'N')){
          struct2 = false;
          start2 = true;
        }
     }
  
  }
//----------------------------------------------------------------------------------  
if(gameState == MINIGAME3){
    if(struct3 == true){
        if((key == 'n')||(key == 'N')){
          struct3 = false; 
          start3 = true; 
        }
     }
     
    if(start3 == true){
      if ((key == RETURN || key == ENTER) && userInput != "") { // checking the users input
        userAns = Integer.parseInt(userInput);
        userInput = "";
        if (userAns == ans[ansCheck]) {
          partA[ansCheck] = 0;
          c++;
          userAns = 0;
          userInput = "";
          ansCheck++;
        }
        else {
          lives--;
          userAns = 0;
          userInput = "";
        }
      }
      if (key == BACKSPACE) {
        if (userInput.length()>0)
          userInput = userInput.substring(0, userInput.length()-1);
      }
      /*if (key!=ENTER){
        userInput+=key; // adding to the users answer.
      } */
      switch(key) {
        case '1': 
          userInput+='1';
          break;
        case '2':
          userInput+='2';
          break;
        case '3': 
          userInput+='3';
          break;
        case '4':
          userInput+='4';
          break;
        case '5': 
          userInput+='5';
          break;
        case '6':
          userInput+='6';
          break;
        case '7': 
          userInput+='7';
          break;
        case '8':
          userInput+='8';
          break; 
        case '9':
          userInput+='9';
          break;
        case '0':
          userInput+='0';
          break;   
          }    
  
       }
    }
//=================================================================================
  if(gameState == MINIGAME4){
     if(struct4 == true){
        if((key == 'n')||(key == 'N')){
          struct4 = false;
          start4 = true;
        }
     }
     if(start4 == true){
          switch(key) {
            case 'W': 
              key_up4 = true;
              break;
            case 'S':
              key_down4 = true;
              break;
            case 'A': 
              key_left4 = true;
              break;
            case 'D':
              key_right4 = true;
              break;
            case 'w': 
              key_up4 = true;
              break;
            case 's':
              key_down4 = true;
              break;
            case 'a': 
              key_left4 = true;
              break;
            case 'd':
              key_right4 = true;
              break;   
          }
        }
      }
//=============================================================
   if(gameState == BOSSFIGHT){
     if(bossSet == true){
        if((key == 'n')||(key == 'N')){
          bossSet = false;
          bossStart = true;
          //lives+=5;
        }
       
     }
     if(bossStart == true){
        switch(key) {
          case 'W': 
            key_upB = true;
            break;
          case 'S':
            key_downB = true;
            break;
          case 'A': 
            key_leftB = true;
            break;
          case 'D':
            key_rightB = true;
            break;
          case 'w': 
            key_upB = true;
            break;
          case 's':
            key_downB = true;
            break;
          case 'a': 
            key_leftB = true;
            break;
          case 'd':
            key_rightB = true;
            break;   
          }
       }
     
   }
}

void keyReleased() {
  // if the player stops holding a key, stop moving in that direction
 //=================================================================================
    if(gameState == PLAY){
      switch(key) {
            case 'W': 
              key_up = false;
              break;
            case 'S':
              key_down = false;
              break;
            case 'A': 
              key_left = false;
              break;
            case 'D':
              key_right = false;
              break;
            case 'w': 
              key_up = false;
              break;
            case 's':
              key_down = false;
              break;
            case 'a': 
              key_left = false;
              break;
            case 'd':
              key_right = false;
              break;
      }
  }
//=================================================================================  

  if(gameState == MINIGAME4){
      switch(key) {
            case 'W': 
              key_up4 = false;
              break;
            case 'S':
              key_down4 = false;
              break;
            case 'A': 
              key_left4 = false;
              break;
            case 'D':
              key_right4 = false;
              break;
            case 'w': 
              key_up4 = false;
              break;
            case 's':
              key_down4 = false;
              break;
            case 'a': 
              key_left4 = false;
              break;
            case 'd':
              key_right4 = false;
              break;
      }
  }
//=================================================================================
   if(gameState == BOSSFIGHT){
        switch(key) {
          case 'W': 
            key_upB = false;
            break;
          case 'S':
            key_downB =false;
            break;
          case 'A': 
            key_leftB = false;
            break;
          case 'D':
            key_rightB = false;
            break;
          case 'w': 
            key_upB = false;
            break;
          case 's':
            key_downB = false;
            break;
          case 'a': 
            key_leftB = false;
            break;
          case 'd':
            key_rightB = false;
            break;   
          }
     }
  
}

  
