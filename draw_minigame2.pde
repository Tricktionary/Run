boolean struct2 = true;
boolean start2 = false;
float ballX = 0;
float ballY = 0;
float speedX = 10;
float speedY = 0;
int hit = 0;
int miss = 0;
//Austin
void draw_minigame2(){
    background(100,200,50);
    //amb.pause();; // Pause Ambiance
    //miniGameMusic.play(); //Play mini music
    if(struct2 == true){
     image(instruct2,0,0);
    }
    
    if(start2 == true){
    float paddle = 100;
     if(ballX < 0 || ballX>width)
       speedX = -speedX;
     if(ballY > height){
       speedY = -speedY;
     float distance = abs(mouseX - ballX);
     if(distance < paddle)
       hit += 1;
     else {
       miss +=1;
       lives --;
     }
   }
     else 
     speedY += 1;
  
  
    ballX+= speedX;
    ballY += speedY;
  
    ellipse(ballX, ballY,50,50);
    fill(50,100,200);
    rect(mouseX-paddle, height-10,2*paddle,10);
  
    fill(0);
    text("hit: " + hit,10,25);
    //text("miss: " + miss, 10,45);
    text("lives: " + lives, 10,65);
    if(hit >= 10){
       gameState = SHOP;
       hit = 0 ;
       miss = 0;
       ballX = 0;
       ballY = 0;
       speedX = 10;
       speedY = 0 ;
       struct2 = true;
       start2 = false;
       gold +=20;
    }
    if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 0; 
       speedCounter = 1;
       game = false;
       stage = 0;
       hit = 0 ;
       miss = 0;
       ballX = 0;
       ballY = 0;
       struct2 = true;
       start2 = false;
      }
  }
}
