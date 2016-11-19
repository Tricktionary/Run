int[] partA;
int[] mid;
int[] partB;
int[] ans;
int[] ranX;
int c = 0, w = 0;
int moving_questions = 0;
int userAns;
int ansCheck = 0;
String userInput = "";

boolean struct3 = true;
boolean start3 = false;

void draw_minigame3(){
   //amb.pause(); // Pause Ambiance
   //miniGameMusic.play(); //Play mini music
  if(struct3 == true){
     image(instruct3,0,0);
      partA = new int[10];
      mid = new int [10];
      partB = new int [10];
      ans = new int [10];
      ranX = new int [10];
 
     // setting the math questions
     for (int i=0; i<10; i++) {
        partA[i] = (int)random(1,10);
        mid[i] = (int)random(0,2);
        partB[i] = (int)random(1,10);
        ranX[i] = (int)random(250,630);
        if (mid[i] == 0)
          ans[i] = partA[i] + partB[i];
        if (mid[i] == 1)
          ans[i] = partA[i] * partB[i];
        }
      }
    
  
  if(start3 == true){
    background(0);
    if (c < 5 && lives >0) { // putting the questions to the screen and moving them.
      moving_questions++;
      for (int i=0; i<10; i++) {
        String sign;
        if (mid[i] == 0)
          sign = " + ";
        else
          sign = " x ";
        fill(255);
        textSize(18);
        if (partA[i] != 0) // Checking if the question has already been answered
          text(partA[i] + sign + partB[i], ranX[i], -(i*30)+moving_questions);
        }
        if ((-300+moving_questions)+ansCheck*10 > 500) // putting the questions to the top if necessary
          moving_questions = 0;
      }
    if(c>=5){
       moving_questions = 0;
       userInput = "";
       gameState = SHOP;
       c=0;
       struct3 = true;
       start3 = false;
       gold +=20;
       ansCheck = 0;
    }
    
    if(lives<=0){
       gameState = END;
       intro = true;
       lives = 5;
       gold = 0; 
       speedCounter = 1;
       game = false;
       stage = 0;
       struct3 = true;
       start3 = false;
       moving_questions = 0;
       userInput = "";
       c=0;
       struct3 = true;
       start3 = false;
       ansCheck = 0;
    }
  
    textSize(14);
    text("Get 5 right to get to the next room.", 4, 460);
    text(5-c + " more to go.", 4, 475);
    text(lives+ " lives left.", 4, 490);
    textSize(32);
    if (userInput != "")
      text(userInput, 440, 460);
    }
  }
