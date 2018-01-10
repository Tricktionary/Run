//-------------------------------------------------------------------DRAW CREDITS---------------------------------------------------------
float gravity = 0.5;
float jump = -6;
float moving_credits = 0.0;
float credits_y = 375;
void draw_credits()
{
  moving_credits= moving_credits + 2.5;
  
  if (moving_credits >=925)
    gameState = MENU;
  background(0);  
  //snow
  for(int z= 0; z<100; z++){
    fill(255);
    if(snowY[z] >= 500)
      snowY[z]=0;
    ellipse(snowX[z], snowY[z]+=(int)random(1,3),5,5);
  }

  text("Credits",375,450-moving_credits);
  text("https://www.youtube.com/watch?v=SNeZWxrkWO0 / Naruto Op 16",100,500-moving_credits);
  text("https://www.youtube.com/watch?v=JtOHOug-qoQ / Five Night ambience",110,550-moving_credits);
  text("https://www.youtube.com/watch?v=S8nRAuhm8xI / Mario coin Sound",105,600-moving_credits);
  text("https://www.youtube.com/watch?v=xn6hhrX34Pw / Wilhem Scream",100,650-moving_credits);
  text("https://www.youtube.com/watch?v=UBVoONryE3s / Boss Fight",115,700-moving_credits);
  text("Thanks For Playing !!",300,1000-moving_credits);
    //GROUND
  fill(255);
  rect(0,410,900,100);
  
 
   jump = jump + gravity;
   credits_y = credits_y +jump;
  
    if(credits_y>=400){
      credits_y = 400;
      jump = -6;
      gravity = 0.5;
    }
  //Enemy Depiction
  fill(75,0,130);
  ellipse(200,credits_y,20,20);
  
  //Player Depiction  
  fill(255,255,255);
  ellipse(625,credits_y,20,20);
}

