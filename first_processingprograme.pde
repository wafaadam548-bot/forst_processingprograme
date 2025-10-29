float circleX, circleY, speedX, speedY,bgR,bgG,bgB;
float lineX, lineY, lineX2, lineY2,line2,line3,line4,line5;
int score;


void setup() {
  size(512, 512);
  frameRate(60);
  circleX = 312;
  circleY = 212;
  speedX = 3;
  speedY = 2;
  score=0;
  bgR=lerp(bgR, random(200), 0.01);
  bgG=lerp(bgG,random(220),0.01);
  bgB=lerp(bgB,random(200),0.01);
  frameRate(20);
  background(bgR,bgB,bgG);


}

void draw() {
  background(200, 200,200 );

 /**for (int i = 0; i < 20; i++) {
    float line2 = random(width);
    float line3 = random(height);
    float line4 = random(width);
    float line5 = random(height);
    line(line2, line3, line4, line5);
  }***/
  

  fill(200,222,198);
  rect(0,300,512,512);
  fill(0);
  textSize(20);
  text("Welcome to the guess the ball game", 60, 30);
  text("Score:"+score,400,40);

  lineX = mouseX - 60;
  lineX2 = mouseX + 60;
  lineY = 450;

  strokeWeight(10);
  stroke(100, 200, 225);
  line(lineX, lineY, lineX2, lineY);

  noStroke();
  fill(255, 50, 50);
  circle(circleX, circleY, 20);
  circleX += speedX;
  circleY += speedY;

  float radius = 20;
  if (circleX > width - radius || circleX < radius) {
    speedX *= -1;
    fill(random(255), random(255), random(255));
    background(bgR,bgB,bgG);


  }
  if (circleY > height - radius || circleY < radius) {
    speedY *= -1;
    fill(random(255), random(255), random(255));
    background(bgR,bgB,bgG);

  }

  if ((circleY + radius >= lineY && circleY - radius <= lineY) && (circleX >= lineX && circleX <= lineX2)) {
    circleY = lineY - radius;
    speedY *= -1;
    score+=1;
    text("Score: "+score,400,30);
    background(bgR,bgB,bgG);

  }
  if (circleY>=height-radius){
        score=0;
        print("Score: "+score);
        background(bgR,bgB,bgG);

  }
}
