float circleX,circleY,speedX,speedY;
void setup(){
size(512, 512);
frameRate(60);
circleX=(312);
circleY=(212);
speedX=1;
speedY=1;
}
void draw(){
 background(100, 200, 69, 59); 
 fill(0);
 textSize(20);  
 text("Welcome to the guess the ball game",100,20);
circle(circleX,circleY,40);
circleX+=speedX;
circleY+=speedY;
if (circleX>width|| circleX<0){
        speedX *= -1;
        speedY *= -1;


}
if (circleY>height|| circleY<0){
        speedX *= -1;
        speedY *= -1;
}
strokeWeight(20);
stroke(100, 200, 225, 100);
line(mouseX+10,mouseY+203,mouseX+150,mouseY+203);
}


