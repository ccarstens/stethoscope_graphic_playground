class Particle extends VerletParticle2D{
    Particle(Vec2D location){
        super(location);

    }

    void display(){
        fill(255);
        noStroke();

        ellipse(x, y, 20, 20);
    }
}