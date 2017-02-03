//--------------------------------------------------------------------------DRAW END SCREEN----------------------------------------------
int ENDmovement = 0;
float transparency = 1; // 0 <= transparency <= 1
float dtrans = -0.01;       // the change in transparency on each call to draw
boolean endLife = true;
void draw_end()
{
  //you win
  if(win == true){
    amb.rewind();
    amb.pause();
    miniGameMusic.pause(); //Play mini music
    winTheme.play();
    frameRate(30);
    background((int)random(1,255),(int)random(1,255),(int)random(1,255));
    fill(0);
    rect(0,410,900,100);
    textSize(50);
    text("You Win",350,200);
    
    
    ENDmovement+=3;
    if(ENDmovement>=410){
      ENDmovement = 410;
      endLife = false;
    }
    float a = map(transparency, 0, 1, 0, 255);
    //player
    fill(255,255,255);
    ellipse(450,400,20,20);
    tint(255, 127);  // Display at half opacity
    //Enemy
    fill(75,0,130,a);
    if(endLife == true){
      ellipse(0+ENDmovement,400,20,20);
    }
    tint(255, 127);  // Display at half opacity
    textSize(23);
    fill(255);
    text("Press N to continue",350,450);
    transparency += dtrans;
    }
    
    
  
  //You Lose
  if(win == false){
    miniGameMusic.pause();
    ENDmovement+=5;
    
    if(ENDmovement>=430){
      ENDmovement = 430;
      transparency += dtrans;
    }
    
    float a = map(transparency, 0, 1, 0, 255);
    background(0);
    fill(75,0,130);
    rect(0,410,900,100);
    textSize(50);
    fill(255);
    text("You Lose",350,175);
    
    //player
    fill(255,255,255,a);
    ellipse(450,400,20,20);
    tint(255, 127);  // Display at half opacity
    //Enemy
    fill(75,0,130,a);
    ellipse(0+ENDmovement,400,20,20);
    tint(255, 127);  // Display at half opacity
    textSize(23);
    fill(255);
    text("Press N to continue",350,450);    
  }
}
