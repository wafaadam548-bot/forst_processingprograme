float circleX, circleY, speedX, speedY;
float lineX, lineY, lineX2, lineY2;
int score;

void setup() {
  size(512, 512);
  frameRate(60);
  circleX = 312;
  circleY = 212;
  speedX = 3;
  speedY = 2;
  score=0;
}

void draw() {
  background(10, 100, 200 , 59);
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

  float radius = 30;
  if (circleX > width - radius || circleX < radius) {
    speedX *= -1;
  }
  if (circleY > height - radius || circleY < radius) {
    speedY *= -1;
  }

  if ((circleY + radius >= lineY && circleY - radius <= lineY) && (circleX >= lineX && circleX <= lineX2)) {
    circleY = lineY - radius;
    speedY *= -1;
    score+=1;
    text("Score: "+score,400,30);
  }
  if (circleY>=height-radius){
        score=0;
        print("Score: "+score);
  }
}
