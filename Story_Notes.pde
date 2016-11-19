
public class Notes {
  int x;
  int y;
  boolean display;
  PImage books;
  public Notes(){
    x = (int)random(50,850);
    y = (int)random(100,400);
    display = true;
    books = loadImage("notes.png");
  }
  
  public void display(){
     image(books,x,y);
  }
   public boolean noteHit(float px, float py){
     if(display == true){ 
        if(((x>=px)&&(x<=px+25))||((x+25>=px)&&(x+25<=px+25))){
           if(((y>=py)&&(y<=py+25))||((y+25>=py)&&(y+25<=py+25))){
               display= false;
               return(true);
          }  
        }
      }
      return(false);
    }
}

