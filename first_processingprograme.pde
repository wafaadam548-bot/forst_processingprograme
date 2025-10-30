float circleX, circleY, speedX, speedY, bgR, bgG, bgB;
float lineX, lineY, lineX2, lineY2;
int score;
float[] starX = new float[40];
float[] starY = new float[40];
float[] prizeX = new float[3];
float[] prizeY = new float[3];
boolean[] prizeActive = new boolean[10];

void setup() {
  size(512, 512);
  frameRate(60);
  circleX = 312;
  circleY = 212;
  speedX = 3;
  speedY = 2;
  score = 0;
  for (int i = 0; i < starX.length; i++) {
    starX[i] = random(width);
    starY[i] = random(height);
  }
  for (int i = 0; i < prizeX.length; i++) {
    prizeX[i] = random(width);
    prizeY[i] = random(-200, 0);
    prizeActive[i] = true;
  }
}

void draw() {
  bgR = 80 + 50 * sin(frameCount * 0.01);
  bgG = 80 + 50 * sin(frameCount * 0.013);
  bgB = 80 + 50 * sin(frameCount * 0.017);
  fill(bgR, bgG, bgB, 50);
  rect(0, 0, width, height);

  lineX = mouseX - 60;
  lineX2 = mouseX + 60;
  lineY = 450;

  fill(255);
  noStroke();
  for (int i = 0; i < starX.length; i++) {
    ellipse(starX[i], starY[i], 3, 3);
    starY[i] += 1;
    if (starY[i] > height) {
      starY[i] = 0;
      starX[i] = random(width);
    }
  }

  fill(255, 215, 0);
  for (int i = 0; i < prizeX.length; i++) {
    if (prizeActive[i]) {
      ellipse(prizeX[i], prizeY[i], 12, 12);
      prizeY[i] += 2;
      if (prizeY[i] > height) {
        prizeY[i] = random(-300, 0);
        prizeX[i] = random(width);
      }
      if (prizeY[i] >= lineY - 6 && prizeX[i] >= lineX && prizeX[i] <= lineX2) {
        score += 5;
        prizeY[i] = random(-300, 0);
        prizeX[i] = random(width);
      }
    }
  }

  fill(0);
  textSize(20);
  text("Bounce Game", 60, 30);
  text("Score " + score, 380, 40);

  strokeWeight(10);
  stroke(100, 200, 225);
  line(lineX, lineY, lineX2, lineY);

  noStroke();
  fill(105, 100, 200);
  circle(circleX, circleY, 20);
  circleX += speedX;
  circleY += speedY;

  float radius = 10;
  if (circleX > width - radius || circleX < radius) speedX *= -1;
  if (circleY < radius) speedY *= -1;
  if ((circleY + radius >= lineY && circleY - radius <= lineY) && (circleX >= lineX && circleX <= lineX2)) {
    circleY = lineY - radius;
    speedY *= -1;
    score += 1;
  }
  if (circleY >= height - radius) {
  score = 0;
  circleX = width / 2;
  circleY = height / 2;
  speedY = -abs(speedY);}
}
