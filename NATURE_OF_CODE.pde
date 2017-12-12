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
    zmax =  200;
    vmin = 1;
    vmax = 20;



    balls = new Ball[20];

    for(int i = 0; i < balls.length; i++){




        balls[i] = new Ball(
            random(xmin, xmax),
            random(ymin, ymax),
            random(zmin, zmax),
            random(vmin, vmax),
            random(vmin, vmax),
            random(vmin, vmax)
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
    stroke(0);
    line(0, 0, 0, 0, 0, -1000);
    line(0, 0, -1000, width, 0, -1000);
    line(width, 0, -1000, width, 0, 0);

    line(0, height, 0, 0, height, -1000);
    line(0, height, -1000, width, height, -1000);
    line(width, height, -1000, width, height, 0);


    line(0, 0, -1000, 0, height, -1000);
    line(width, 0, -1000, width, height, -1000);

    popMatrix();
}

// void mouseMoved(){
//     z = map(mouseX, 0, width, -500, 600);
//     y = mouseY;
//     println(z);
// }