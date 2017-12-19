class Mover{
    PVector location, velocity, acceleration, mouse, direction;
    int constraint = 75;
    float accelerationAmount = 1.2;
    float speedLimit = 25;

    boolean isRandom = false;
    color c;
    int size = 3;

    Mover(){
        location = new PVector(width / 2, height / 2);
        velocity = new PVector(0, 0);
        c = color(255, 0, 0);
        // c = color(random(255), random(255), random(255));
    }

    void setRandomLocation(){
        location = new PVector(random(0, width), random(0, height));
    }


    void updateWithMouse(){
        if(isRandom) isRandom = false;
        setMouse();
        direction = PVector.sub(mouse, location);
        direction.normalize();
        setAcceleration();
        velocity.add(acceleration);
        velocity.limit(speedLimit);
        location.add(velocity);
    }

    void updateWithRandom(){
        if(!isRandom) {
            isRandom = true;
            setRandomDirection();
        }

        setAcceleration();
        velocity.add(acceleration);
        velocity.limit(speedLimit);
        location.add(velocity);
    }



    void display(){
        noStroke();
        fill(c);
        // fill(0);
        // checkEdges();
        printPixel(255, 0, 0, size);
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

    void render(String method){
        if(method == "MOUSE") updateWithMouse();
        else if(method == "RANDOM") updateWithRandom();
        
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
}