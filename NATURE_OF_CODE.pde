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



    // m = new Mover();
    // acceleration = new PVector(random(0, 0.1), random(0, 0.1));
    // m.acceleration = acceleration;
    // // scale(0.5);

    
}



void draw(){


    // pushMatrix();
    // scale(0.5);
    // translate(width / 2, height / 2);
    // dropLine();
    

    // m.next();


    // popMatrix();

    background(255);

    mouse = new PVector(mouseX, mouseY);

    c = new PVector(width / 2, height / 2);

    d = mouse.copy();
    d.sub(c);

    float mag = d.mag();

    fill(0);
    noStroke();
    
    ellipse(c.x, c.y, 3, 3);

    rect(0, 0, mag, 10);

    println(d.mag());
    println(mouse.mag());

    

}  



// void dropLine(){


//     stroke(0);
//     line(0, 0, width, 0);
//     line(width, 0, width, height);
//     line(width, height, 0, height);
//     line(0, height, 0, 0);
// }



// void updateAcceleration(){
//     PVector direction = mouse.copy();
//     direction.sub(m.location);
//     direction.normalize();
//     direction.mult(0.1);
//     m.acceleration = direction;
// }


// void mouseMoved(){
//     mouse.x = mouseX;
//     mouse.y = mouseY;
// }




