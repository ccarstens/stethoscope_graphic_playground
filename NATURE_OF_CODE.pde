PVector location;
PVector velocity;

Mover m;
PVector acceleration;


PVector mouse;

PVector c, d;

void setup(){

    background(255);
    size(1200, 800);
    frameRate(25);



    m = new Mover();
    

    
}



void draw(){
    background(255);
    dropLine();

    // pushMatrix();
    // scale(0.5);
    // translate(width / 2, height / 2);
    m.next();
    // popMatrix();


}  



void dropLine(){




    pushMatrix();
    scale(0.5);
    translate(width / 2, height / 2);
    

    stroke(0);
    line(0, 0, width, 0);
    line(width, 0, width, height);
    line(width, height, 0, height);
    line(0, height, 0, 0);

    popMatrix();
}







