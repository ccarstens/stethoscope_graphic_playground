class Mover{
    PVector location, velocity, acceleration, mouse;
    int constraint = 75;

    Mover(){
        location = new PVector(width / 2, height / 2);
        velocity = new PVector(0, 0);
    }

    void setRandomLocation(){
        location = new PVector(random(0, width), random(0, height));
    }


    void update(){
        mouse = new PVector(mouseX, mouseY);
        PVector dir = PVector.sub(mouse, location);
        dir.normalize();
        acceleration = PVector.mult(dir, 2);
        velocity.add(acceleration);
        velocity.limit(20);
        location.add(velocity);
    }

    void display(){
        noStroke();
        fill(255, 0, 0);
        // fill(0);
        // checkEdges();
        ellipse(location.x, location.y, 1, 1);
    }

    void checkEdges(){
        
        if(
            (location.x > width - constraint && acceleration.x > 0) || (location.x < constraint && acceleration.x < 0)

        ){
             acceleration.x *= -1;
        }
        
        if(
            (location.y > height - constraint  && acceleration.y > 0) || (location.y < constraint && acceleration.y < 0)

        ){
             acceleration.y *= -1;
        }
    }

    void next(){
        update();
        display();
    }
}