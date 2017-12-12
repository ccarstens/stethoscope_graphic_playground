
int x;
int y;
int size = 40;
int velocityX = 3;
int velocityY = 10;

color c;

void setup(){
    // background(255);
    size(1200, 800);
    x = (int)random(0, width);
    y = (int)random(0, height);

    c = color(155, 139, 33);
}



void draw(){
    background(255, 255, 255, 1);
    noStroke();
    fill(0);

    if(x > width || x < 0) velocityX *= -1;
    if(y > height || y < 0) velocityY *= -1;

    x += velocityX;
    y += velocityY;

    ellipse(x, y, size, size);
}