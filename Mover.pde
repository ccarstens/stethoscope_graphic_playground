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
        setMouse();
        PVector dir = PVector.sub(mouse, location);
        dir.normalize();
        setAcceleration(dir);
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

    void setAcceleration(PVector direction){
        acceleration = PVector.mult(direction, 2);
    }

    void setMouse(){
        mouse = new PVector(mouseX, mouseY);
        mouse.mult(6);

        noStroke();
        fill(255, 0, 0);
        ellipse(mouse.x, mouse.y, 4, 4);
    }

    void setRandomAcceleration(){
        println("random");
        PVector newDirection = PVector.random2D();
        setAcceleration(newDirection);
    }
}