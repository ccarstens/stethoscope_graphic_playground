class Mover{
    PVector location, velocity, acceleration;
    int constraint = 75;

    Mover(){
        location = new PVector(width / 2, height / 2);
        velocity = new PVector(0, 0);
    }


    void update(){
        velocity.add(acceleration);
        velocity.limit(5);
        location.add(velocity);
    }

    void display(){
        stroke(0);
        fill(75);
        // checkEdges();
        ellipse(location.x, location.y, 2, 2);
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