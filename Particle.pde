class Particle extends VerletParticle2D{
    Particle(Vec2D location){
        super(location);

    }

    void display(int r, int g, int b){
        fill(r, g, b);
        noStroke();

        ellipse(x, y, 6, 6);
    }
}