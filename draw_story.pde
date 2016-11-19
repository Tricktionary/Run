int readingCount;
 
 
void draw_story(){
  background(0);
  fill(255);
  if(noteBookCount>6){
     noteBookCount = 5; 
  }
  if ( noteBookCount <= readingCount) { 
    gameState = SHOP;
    readingCount=0;
  }
  image(story[readingCount],0,0);
  text("Press n to read through",640,480);
 
}
