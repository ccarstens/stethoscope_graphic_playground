class Particle extends VerletParticle2D{
    Particle(Vec2D location){
        super(location);

    }

    void display(){
        fill(0);
        noStroke();

        ellipse(x, y, 6, 6);
    }
}