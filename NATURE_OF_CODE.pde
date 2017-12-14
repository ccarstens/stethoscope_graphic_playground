PVector location;
PVector velocity;

Mover m;
PVector acceleration;


PVector mouse;

void setup(){

    background(255);
    size(1200, 800);



    m = new Mover();
    acceleration = new PVector(random(0, 0.1), random(0, 0.1));
    m.acceleration = acceleration;
    // scale(0.5);
    mouse = new PVector(mouseX, mouseY);
    
}



void draw(){


    pushMatrix();
    scale(0.5);
    translate(width / 2, height / 2);
    dropLine();
    

    m.next();


    popMatrix();



}  



void dropLine(){


    stroke(0);
    line(0, 0, width, 0);
    line(width, 0, width, height);
    line(width, height, 0, height);
    line(0, height, 0, 0);
}



void updateAcceleration(){
    PVector direction = mouse.copy();
    direction.sub(m.location);
    direction.normalize();
    direction.mult(0.1);
    m.acceleration = direction;
}


void mouseMoved(){
    mouse.x = mouseX;
    mouse.y = mouseY;
    updateAcceleration();
}