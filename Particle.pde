class Particle extends VerletParticle2D{

    Particle(Vec2D location){
        super(location);

    }

    void display(int r, int g, int b){
        if(this.isLocked()){
            r = g = b = 255;
        }
        fill(r, g, b);
        noStroke();




        ellipse(x, y, 6, 6);
    }
}