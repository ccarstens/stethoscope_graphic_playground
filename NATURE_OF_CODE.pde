PVector location;
PVector velocity;

int size = 20;

float x, y, z;

int xmin, xmax, ymin, ymax, zmin, zmax, vmin, vmax;

// Ball[] balls;

Ball ball, ball2;
Ball[] balls;
void setup(){

    background(255);
    size(1200, 800, P3D);


    xmin =  0;
    xmax =  width;
    ymin =  0;
    ymax =  height;
    zmin =  -1000;
    zmax =  -200;
    vmax = 5;



    balls = new Ball[500];

    for(int i = 0; i < balls.length; i++){




        balls[i] = new Ball(
            random(xmin, xmax),
            random(ymin, ymax),
            random(zmin, zmax),
            random(vmin, vmax),
            random(vmin, vmax),
            random(vmax * -1, vmax)
        );

        // x += 50;
        
    }


    
    
}



void draw(){

    

    // location.add(velocity);

    // if(location.x > width || location.x < 0) velocity.x *= -1;
    // if(location.y > height || location.y < 0) velocity.y *= -1;

    background(255);
    dropLine();
    noStroke();
    fill(0);

    for(Ball b: balls){
        b.next();
    }
    
    

}  


void dropLine(){
    pushMatrix();
    translate(0, 0, 0);
    stroke(193, 247, 255);
    line(xmin, ymin, zmax, xmin, ymin, zmin);
    line(xmin, ymin, zmin, xmax, ymin, zmin);
    line(xmax, ymin, zmin, xmax, ymin, zmax);

    line(xmin, ymax, zmax, xmin, ymax, zmin);
    line(xmin, ymax, zmin, xmax, ymax, zmin);
    line(xmax, ymax, zmin, xmax, ymax, zmax);


    line(xmin, ymin, zmin, xmin, ymax, zmin);
    line(xmax, ymin, zmin, xmax, ymax, zmin);

    line(xmin, ymin, zmax, xmin, ymax, zmax);
    line(xmax, ymin, zmax, xmax, ymax, zmax);

    line(xmin, ymin, zmax, xmax, ymin, zmax);
    line(xmin, ymax, zmax, xmax, ymax, zmax);

    popMatrix();
}

// void mouseMoved(){
//     z = map(mouseX, 0, width, -500, 600);
//     y = mouseY;
//     println(z);
// }