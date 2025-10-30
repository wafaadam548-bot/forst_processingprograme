float circleX, circleY, speedX, speedY,bgR,bgG,bgB;
float lineX, lineY, lineX2, lineY2,line2,line3,line4,line5;
int score;
float[] starX = new float[40];
float[] starY = new float[40];
float[]prizeX=new float[10];
float[]prizeY=new float[10]

void setup() {
  size(512, 512);
  frameRate(60);
  circleX = 312;
  circleY = 212;
  speedX = 3;
  speedY = 2;
  score=0;
  background(0);
  frameRate(90);
  for (int i = 0; i < starX.length; i++) {
    starX[i] = random(width);
    starY[i] = random(height);
  }
 for(int i=0; i< prizeX.length;i++) {
  prizeX[i]= random(width);
  prizeY[i]= random(height);
  prizeActive[i] = true;
 }

}

void draw() {
  bgR=80+50*sin(frameCount*0.01);//background
  bgG=80+50*sin(frameCount*0.013);  //sin is new it is to make like Gradient in the color the values 80,70,80 thats control the shining 
  bgG=80+50*sin(frameCount*0.017);
  fill(200,120,110,80);
  rect(0,0,width,height); 
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
 /**for (int i = 0; i < 20; i++) {
    float line2 = random(width);
    float line3 = random(height);
    float line4 = random(width);
    float line5 = random(height);
    line(line2, line3, line4, line5);
  }***/
  fill(255, 215, 0);
  noStroke();
  for (int i = 0; i < prizeX.length; i++) {
    if prizeActive[i]
     {
    ellipse(prizeX[i], prizeY[i], 12, 12);
    prizeY[i] += 2;  
        if (prizeY[i] > height) {
      prizeY[i] = random(-300, 0);
      prizeX[i] = random(width);
    }
  }
  float d = dist(circleX, circleY, prizeX[i], prizeY[i]);
    if (d < 20) {  
      score += 5; 
      prizeActive[i] = false;
      prizeX[i] = random(width);
      prizeY[i] = random(-200, 0);
      prizeActive[i] = true;}
      //here I should add voice   

  fill(200,222,198,10);
  rect(0,300,512,512);
  fill(0);
  textSize(20);
  text("Bounce Game", 60, 30);
  text("Score             "+score,380,40);
  fill(200,30,100,0);
  stroke(0);
  strokeWeight(5);
  rect(370,10,200,40);
  line(450,10,450,50);
  lineX = mouseX - 60;
  lineX2 = mouseX + 60;
  lineY = 450;

  strokeWeight(10);
  stroke(100, 200, 225);
  line(lineX, lineY, lineX2, lineY);//the ball
  noStroke();
  fill(105, 100, 200);
  circle(circleX, circleY, 20);
  circleX += speedX;
  circleY += speedY;

  float radius = 10;
  if (circleX > width - radius || circleX < radius) {
    speedX *= -1;
    fill(random(255), random(255), random(255));


  }
  if (circleY > height - radius || circleY < radius) {
    speedY *= -1;
    fill(random(255), random(255), random(255));

  }
  if ((circleY + radius >= lineY && circleY - radius <= lineY) && (circleX >= lineX && circleX <= lineX2)) {
    circleY = lineY - radius;
    speedY *= -1;
    score += 1;
    fill(random(200), random(200), random(200));
}

  
  if (circleY>=height-radius){
        score=0;
        text("Score: " + score, 380, 40);

  }
  

}
