//----------------------DRAW MENU--------------------------------------------------------------------------------------------------------------
int menuX = 0;
float menuY = 400;
int menuY2 = 400;
int menuX2 = -450;
int [] snowX;
int [] snowY;
int box =650;


void draw_menu()
{  
  frameRate(60);
  noteBookCount = 0;
  tint(255,255);
  winTheme.rewind();
  winTheme.pause();
  win = false;
  gold=10;
  miniGameMusic.rewind();
  miniGameMusic.pause();
  
  amb.play();
  background(0);
  //snow
  for(int z= 0; z<100; z++){
    fill(255);
    if(snowY[z] >= 500)
      snowY[z]=0;
    ellipse(snowX[z], snowY[z]+=(int)random(1,3),5,5);
  }
  
  //Player Depiction
  
  fill(255,255,255);
  menuX = menuX + 5;
  //reset
  if (menuX2 >=900){
    menuX= 0;
    menuX2 = -450;
    box = (int)random(400,900);
  }
  //jump
   jump = jump + gravity;
   menuY = menuY +jump;
   if (menuY>400){
     menuY= 400;
   }
    if((box-120<menuX) && (menuX<box)){
      jump = -5;
    }
    //pLAYER Circle
    ellipse(menuX,menuY,20,20);

  //Enemy Depiction
  fill(75,0,130);
  menuX2 = menuX2 + 5;
  //Enemy Circle
  ellipse(menuX2,menuY2,20,20);
  
  //GROUND
  fill(128,0,128);
  rect(box,350,60,60);
  rect(0,410,900,100);
//------TEXT--------------------------------------------------------------------------------------------------------
  fill(0);
  textSize(50);
  text("RUNNING MAN",275,200);
  fill(230,230,230);
  text("RUNNING MAN",274,200);
  fill((int)random(190,250),(int)random(0,250),(int)random(100,250));
  text("RUNNING MAN",273,200);
  
  textSize(20);
  fill(255);
  text("PRESS P TO PLAY",300,250);
  text("PRESS I FOR INSTRUCTIONS",300,275); 
  text("PRESS C FOR CREDITS",300,300);
}
