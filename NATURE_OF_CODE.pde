PVector location;
PVector velocity;

int size = 20;

float x, y, z;

// Ball[] balls;

Ball ball, ball2;
Ball[] balls;
void setup(){

    background(255);
    size(1200, 800, P3D);
    x = 0;
    z = 200;
    balls = new Ball[20];

    for(int i = 0; i < balls.length; i++){
        balls[i] = new Ball(x, 0, z, 0, 2, 0);

        x += 50;
        z -= 50;
    }


    
    
}



void draw(){

    // location.add(velocity);

    // if(location.x > width || location.x < 0) velocity.x *= -1;
    // if(location.y > height || location.y < 0) velocity.y *= -1;

    background(255);
    noStroke();
    fill(0);

    for(Ball b: balls){
        b.next();
    }
    
    

}  


// void mouseMoved(){
//     z = map(mouseX, 0, width, -500, 600);
//     y = mouseY;
//     println(z);
// }