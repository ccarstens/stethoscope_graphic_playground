PVector location;
PVector velocity;

int size = 20;

void setup(){

    background(255);
    size(1200, 800);

    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(5, 5);
}



void draw(){

    location.add(velocity);

    if(location.x > width || location.x < 0) velocity.x *= -1;
    if(location.y > height || location.y < 0) velocity.y *= -1;

    noStroke();
    fill(0);
    ellipse(location.x, location.y, size, size);

}  