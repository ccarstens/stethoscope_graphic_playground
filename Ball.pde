class Ball{
    PVector location, velocity;

    color c;

    Ball(float lx, float ly, float lz, float vx, float vy, float vz){
        this.location = new PVector(lx, ly, lz);
        this.velocity = new PVector(vx, vy, vz);
        this.c = color(0);
    }

    void move(){
        this.location.add(this.velocity);
    }

    void show(){
        pushMatrix();
        translate(this.location.x, this.location.y, this.location.z);
        noStroke();
        fill(this.c);
        ellipse(0, 0, 30, 30);
        popMatrix();
    }

    void next(){
        this.move();
        this.show();
    }
}