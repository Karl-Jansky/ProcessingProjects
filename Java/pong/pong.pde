int player1Pos = 400;
int player2Pos = 400;

int playerLength = 120;

int player1Score = 0;
int player2Score = 0;

int rad = 30;        // Width of the shape
float xpos, ypos;    // Starting position of shape

float speed = 2;

float xspeed = 2.8 * speed;  // Speed of the shape
float yspeed = 2.2 * speed;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

void setup() {
  size(800, 800);

  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(102);
  String scoreboard = player1Score + " " + player2Score;
  textSize(120);
  text(scoreboard, 300,300);

  rect(800- 50-50, player1Pos, 50, playerLength);

  rect(50, player2Pos, 50, playerLength);

  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  //player1 bounce
 if (xpos > width-rad-50-50 && ypos > player1Pos && ypos < player1Pos+playerLength) {
   xdirection *= -1;
  }
  
   if (xpos < 100+25&& ypos > player2Pos && ypos < player2Pos+playerLength) {
   xdirection *= -1;
  }




  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos < rad) {
    player2Score++;
        xpos = 400;
    ypos=400;
  }
  
  if (xpos > width-rad) {
    player1Score++;
    xpos = 400;
    ypos=400;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player1Pos-=10;
    } else if (keyCode == DOWN) {
      player1Pos+=10;
    }
  }
  if (key == 'w') {
      player2Pos-=10;
    } else if (key == 's') {
      player2Pos+=10;
    }
}
