PVector location;
PVector velocity;

int size = 20;

float x, y, z;

void setup(){

    background(255);
    size(1200, 800, P3D);

    x = width / 2;
    y = height / 2;
    z = 0;
}



void draw(){

    // location.add(velocity);

    // if(location.x > width || location.x < 0) velocity.x *= -1;
    // if(location.y > height || location.y < 0) velocity.y *= -1;

    background(255);
    noStroke();
    fill(0);

    translate(x, y, z);

    ellipse(0, 0, size, size);

    

}  


void mouseMoved(){
    z = map(mouseX, 0, width, -500, 600);
    y = mouseY;
    println(z);
}