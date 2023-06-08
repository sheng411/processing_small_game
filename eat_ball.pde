int num=50;
int score=0;
int level=1;
int flag=0;
int rx=35;
int ry=30;
float ms=0;  //time ms
float s=0;  //time sec
int ck=0;

int over=4;  //over level

Ball[] b;
class Ball{
  float x,y,xsp,ysp;
  int bfg=0;
  color cl;
  Ball(float x,float y,float xs,float ys,int bfg){
    x=width/4;
    y=height/4;
    xsp=xs;
    ysp=ys;
    cl=color(random(255),random(255),random(255));
  }
/*  bug
  void run2(){
      x=x+xsp;
      y=y+ysp;
      if((x>140)||(x<0)){
        xsp=xsp*-1;
      }
      if((y>500)||(y<310)){
        ysp=ysp*-1;
      }
   }
*/

  void run(){
      x=x+xsp;
      y=y+ysp;

      if((x>width)||(x<0)){
        xsp=xsp*-1;
      }
      if((y>340)||(y<0)){
        ysp=ysp*-1;
      }

      stroke(0);
      strokeWeight(2);
      fill(cl);
      circle(x,y,10);
  
      if(flag==1 && x>=mouseX-rx && x<=mouseX+rx && y>=mouseY-ry && y<=mouseY+ry && bfg==0){
         score=score+1;
         y=380+score%1000+20;
         bfg=1;
      }
   }
   
}

void generate(){    //ball making
  for(int i=0;i<num;i++){
    b[i]=new Ball(random(10),random(10),random(10),random(10),0);
  }
}

void setup(){
  size(800,500);
  b=new Ball[num];
  generate();
  score=0;
}



void draw(){
  ms=millis();
  s=ms/1000;
  if(ck==1){
    delay(2000);
    ck=0;
  }
  background(135,206,250);
  for(int i=0;i<num;i++){
    b[i].run();
}
  
  line(0,350,800,350);
  //line(150,350,150,500);
  textSize(40);
  fill(255,255,0);
  text("Score:",10,40);
  text(score,130,40);
  fill(138,43,226);
  text("Level:",200,40);
  text(level,310,40);
  fill(0,255,217);
  text("Time:",380,40);
  text(s,480,40);
  
  
  if (mousePressed) {
    stroke(255);
    flag=1;
  } else {
    stroke(0);
    flag=0;
  }
  
  
  
  stroke(125,50,0);
  fill(123,104,238);
  rect(mouseX-rx,mouseY-ry,2*rx,2*ry);
  stroke(255);
  line(mouseX-rx,mouseY-ry,mouseX+rx,mouseY-ry);
  
  if(level==over){
    textSize(50);
    fill(255,255,0);
    text("Total time:",200,250);
    text(s,430,250);
    text("s",580,250);
    text("Win!",350,200);
    println("win ok");
    noLoop();
  }
  
  if(score>=num){
    fill(255,0,255);
    text("Waiting...",330,250);
    println("waiting ok");
    score=0;
    level=level+1;
    num=num-10;
    rx=rx-10;
    ry=ry-10;
    generate();
    ck=1;
  }
}
