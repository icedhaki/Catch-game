Square square;
Square square1;
Square square2;
Square square3;
Square square4;
Square square5;
Square square6;
int s=0;
int count=0;
String t,g,v,u,l;
float color1=random(100,255);
float color2=random(100,255);
float color3=random(100,255);

void setup(){
  size(400,600);  
  square=new Square();
  square1=new Square();
  square2=new Square();
  square3=new Square();
  square4=new Square();
  square5=new Square();
  square6=new Square();
}

void draw(){
  background(255);
  
  if(count==0){
    fill(0);
    textSize(20);
    t="Catcher Game";
    g="Press 'Start' to start, 'Exit' to exit";
    v="Catch squares with paddle";
    text(t,width/3,height/6);
    text(v,width/5,height/4);
    text(g,width/8,height/3);
    rectMode(CENTER);
    fill(255);
    float rect1X=width/4;
    float rect2X=3*width/4;
    float rect1Y=2*height/3;
    float rectW=130;
    float rectH=50;
    
    rect(rect1X,rect1Y,rectW,rectH);
    rect(rect2X,rect1Y,rectW,rectH);
    fill(0);
    textSize(20);
    l="Start game";
    text(l,rect1X-(rectW/2.5),rect1Y+rectH/8);
    u="Exit game";
    text(u,rect2X-(rectW/2.5),rect1Y+rectH/8);
    
    // start button
    if(mousePressed==true && mouseX>=rect1X-rectW/2 && mouseX<=rect1X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      count=count+1;
    }
    // exit button
    else if (mousePressed==true && mouseX>=rect2X-rectW/2 && mouseX<=rect2X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      exit();
    }
  }
  
  else{
    for(int i=50;i<width;i=i+100){
      for(int j=70;j<width;j=j+100){
        rectMode(CENTER);
        fill(0,color1,0);
        rect(i,j,10,100);
        fill(color2,color1,0);
        ellipse(i+20,j+20,50,50);
        ellipse(i+20,j-20,50,50);
        ellipse(i-20,j+20,50,50);
        ellipse(i-20,j-20,50,50);
        fill(color3,0,0);
        ellipse(i,j,30,30);
      }
    }
  
  int i=0;
  while(i<width){
    int j=0;
    while(j<height){
      fill(random(0,100),random(0,100),random(0,100));
      rect(i,j,10,10);
      j=j+10;
    }
    i=i+10;
  }
  
  square.move();
  square.reset();
  
  square1.move();
  square1.reset();
  
  square2.move();
  square2.reset();
  
  square3.move();
  square3.reset();
  
  square4.move();
  square4.reset();
  
  square5.move();
  square5.reset();
  
  square6.move();
  square6.reset();
  
  fill(255);
  textSize(16);
  text("Score:",20,20);
  text(s,70,20);
  
  fill(255);
  rectMode(CENTER);
  rect(width-30,mouseY,20,80);// paddle
  
  }
}

class Square{
  float x;
  float y;
  float w;
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);
  float U=1;
  
  Square(){
    x=0;
    y=random(0,height);
    w=random(20,50);
  }
  
  void move(){
    x=x+U+s;
  }
  
  void reset(){
    if(x>width-40&&x<width&&y>mouseY-40&&y<mouseY+40){ 
      rect(x,y,w,w);
      x=0;
      y=random(0,600);
      s=s+1;
      r=random(0,255);
      g=random(0,255);
      b=random(0,255);
      w=random(20,50);
    } 
    else{
      fill(r,g,b);
      rect(x,y,w,w);
      x=x+4;
    }

    if(x>=width){
      s=s-1;
      x=0;
      y=random(0,600);
      r=random(0,255);
      g=random(0,255);
      b=random(0,255);
      w=random(20,50);
    }
  }
}
