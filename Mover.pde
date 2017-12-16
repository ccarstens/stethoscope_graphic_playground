class Mover{
    PVector location, velocity, acceleration, mouse, direction;
    int constraint = 75;
    float accelerationAmount = 1.2;
    float speedLimit = 25;
    int size = 3;

    float frictionCoeficient = 0.02;

    boolean isRandom = false;
    color c;

    Mover(){
        location = new PVector(width / 2, height / 2);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        c = color(random(255), random(255), random(255));
    }

    void setRandomLocation(){
        location = new PVector(random(0, width), random(0, height));
    }


    void updateWithMouse(PVector force){
        if(isRandom) isRandom = false;
        setMouse();
        direction = PVector.sub(mouse, location);
        direction.normalize();
        setAcceleration();
        acceleration.div(mouse.dist(location));
        acceleration.mult(10);
        applyForce(force);
        applyForce(getFriction());
        velocity.add(acceleration);
        velocity.limit(speedLimit);
        location.add(velocity);
    }

    void updateWithRandom(PVector force){
        if(!isRandom) {
            isRandom = true;
            setRandomDirection();
        }

        setAcceleration();
        applyForce(force);
        velocity.add(acceleration);
        velocity.limit(speedLimit);
        location.add(velocity);
    }

    void applyForce(PVector force){
        acceleration.add(force.copy());
        
    }

    PVector getFriction(){
        PVector friction = velocity.copy();
        friction.mult(-1);
        friction.normalize();
        friction.mult(frictionCoeficient);
        return friction;
    }



    void display(){
        noStroke();
        // fill(c);
        // fill(0);
        // checkEdges();

        printPixel(255, 0, 0, size);
        
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

    void render(String method, PVector force){
        if(method == "MOUSE") updateWithMouse(force);
        else if(method == "RANDOM") updateWithRandom(force);
        
        display();
    }

    void setAcceleration(){
        acceleration = PVector.mult(direction, accelerationAmount);
    }

    void setMouse(){
        mouse = new PVector(mouseX, mouseY);
        mouse.mult(6);

        noStroke();
        fill(255, 0, 0);
        ellipse(mouse.x, mouse.y, 4, 4);
    }

    void setRandomDirection(){
        println("random");
        direction = PVector.random2D();
        
    }

    void printPixel(int r, int g, int b, int s){
        pushMatrix();
        translate(location.x, location.y);

        float single = s / 3;

        fill(r, 0, 0);
        rect(0, 0, single, size);

        fill(0, g, 0);
        rect(single, 0, single, size);

        fill(0, 0, b);
        rect(single * 2, 0, single, size);
        popMatrix();
    }
}