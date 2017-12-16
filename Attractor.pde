class Attractor{
    PVector location;
    float strength;
    float radius;

    Attractor(float x, float y, float radius){
        location = new PVector(x, y);
        this.radius = radius;
    }

    void display(){
        pushMatrix();
        translate(location.x, location.y);
        noStroke();
        fill(0);
        ellipse(0, 0, radius * 2, radius * 2);
        popMatrix();
    }
}