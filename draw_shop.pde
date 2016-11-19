//-----------------------------------------------------------SHOP----------------------------------------------------------------------------
int buying = 0;
boolean wait = false;
void draw_shop()
{
  if(wait == true){
      buying++;
      if (buying >=10){
        buying = 0;
        wait = false;
      }
  }
    
  background(0);
  tint(255, 255);
  image(shopping,0,0);
  
  textSize(50);
  fill(255);
  text("Current Gold : "+gold,450,150);
  //rect(543,193,62,62);
  text(lives,450,241);
  if (mousePressed && (mouseButton == LEFT) && (mouseX>543)&&(mouseX<605)&&(mouseY>193) && (mouseY<255) && (gold>=5) && (wait==false) && (buying == 0)){
    wait = true;
    lives++;
    gold = gold - 5;
  }
  textSize(50);
    fill(255);
  //rect(543,340,62,62);
  if (mousePressed && (mouseButton == LEFT) && (mouseX>543)&&(mouseX<605)&&(mouseY>340) && (mouseY<402) && (gold>=10) && (wait==false) && (buying == 0) ){
    wait = true;
    speedCounter++;
    gold = gold - 10;
  }
  text(speedCounter,450,400);

  textSize(20);
  text("Amount of notes :" + noteBookCount,640,200);
  text("Press R to read Notes",640,230);
}
