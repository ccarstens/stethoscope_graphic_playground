class Entity{
    PVector location, velocity, acceleration, direction;

    boolean phase;

    Entity(float x, float y){
        location = new PVector(x, y);
        phase = true;
    }


    void display(){
        pushMatrix();
        translate(location.x, location.y);
        stroke(0);
        fill(255, 0, 0);
        ellipse(0, 0, 20, 20);
        popMatrix();
    }
}