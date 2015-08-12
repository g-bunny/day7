PVector location;
PVector velocity;
PVector playerLocation;
PVector playerVelocity;
boolean gameOver = false;
boolean collided = false;
boolean reset = false;
boolean startGame = true;

float distance;
void setup(){
  size(800, 500);
  
  location = new PVector(25, 25);
  velocity = new PVector(5,5);
  playerLocation = new PVector( 500, 300);
  playerVelocity = new PVector(0, 0);
  collided = false;
}

void draw(){
  background(255);
  
//  if (startGame == true){
  location.add(velocity);
  playerLocation.add(playerVelocity);
//  for (int i = 0; i < 500; i ++){
//    ellipse(random(0, location.x), random(0,location.y) + i, 50, 50);
//  }
  distance = dist(location.x, location.y, playerLocation.x, playerLocation.y);
  ellipse(location.x, location.y, 50, 50);
  ellipse(playerLocation.x, playerLocation.y, 100, 100);
  if (location.x > width - 25){
    velocity.x = velocity.x * -1;
  }
  if (location.x < 0 + 25){
    velocity.x = velocity.x * -1;
  }
  if (location.y > height - 25){
    velocity.y = velocity.y * -1;
  }
  if (location.y < 0 + 25){
    velocity.y = velocity.y * -1;
  }
  if (playerLocation.x > width - 50){
    playerVelocity.x = playerVelocity.x * -1;
  }
  if (playerLocation.x < 0 + 50){
    playerVelocity.x = playerVelocity.x * -1;
  }
  if (playerLocation.y > height - 50){
    playerVelocity.y = playerVelocity.y * -1;
  }
  if (playerLocation.y < 0 + 50){
    playerVelocity.y = playerVelocity.y * -1;
  }
  if (distance < 75 && collided == false){
//    velocity.x = velocity.x * -1;
//    playerVelocity.x = playerVelocity.x * -1;
//    velocity.y = velocity.y * -1;
//    playerVelocity.y = playerVelocity.y * -1;
    collided = true;
  }
  if (distance < 70 && collided == true){
//    velocity.x = velocity.x * -1;
//    playerVelocity.x = playerVelocity.x * -1;
//    velocity.y = velocity.y * -1;
//    playerVelocity.y = playerVelocity.y * -1;
      gameOver = true;
  }
  if (gameOver == true){
    textSize(100);
    fill(255, 0, 0);
    text("Game Over", width/4, height/2);
    velocity.mult(0);
    playerVelocity.mult(0);
    
    reset = true;
  }

//  line(location.x + 25, location.y + 25, mouseX, mouseY);
  println(collided);
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      playerVelocity.y -= 1;
    }
    if (keyCode == DOWN){
      playerVelocity.y += 1;
    }
    if (keyCode == RIGHT){
      playerVelocity.x += 1;
    }
    if (keyCode == LEFT){
      playerVelocity.x -=1;
    }
    
    if (keyCode == UP && reset == true){
      
    }
    
  }
}
