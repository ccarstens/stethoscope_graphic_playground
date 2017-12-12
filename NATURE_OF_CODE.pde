PVector location;
PVector velocity;

Mover m;
PVector acceleration;

void setup(){

    background(255);
    size(1200, 800);



    m = new Mover();
    acceleration = new PVector(0.0143, 0.09637);
    m.acceleration = acceleration;
    // scale(0.5);
    
}



void draw(){


    pushMatrix();
    scale(0.5);
    translate(width / 2, height / 2);
    dropLine();
    m.next();
    m.next();
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
