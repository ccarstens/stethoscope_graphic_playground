class Ball{
    PVector location, velocity;

    color c;
    int size;

    Ball(float lx, float ly, float lz, float vx, float vy, float vz){
        this.location = new PVector(lx, ly, lz);
        this.velocity = new PVector(vx, vy, vz);
        this.setRandomColor();

        this.size = 25;
    }

    void move(){
        this.location.add(this.velocity);
    }

    void show(){
        pushMatrix();
        translate(this.location.x, this.location.y, this.location.z);

        this.checkEdges();


        noStroke();
        fill(this.c);
        ellipse(0, 0, this.size, this.size);
        popMatrix();
    }

    void next(){
        this.move();
        this.show();
    }


    void setRandomColor(){

        float r = random(0, 255);
        float g = random(0, 255);
        float b = random(0, 255);


        color x = color(r, g, b);

        this.c = x;
    }

    int sh(){
        // return 0;
        return this.size / 2;
    }

    void checkEdges(){
        if(this.location.x + this.sh()  > width || this.location.x - this.sh() < 0){
            // this.setRandomColor();
            this.velocity.x *= -1;
        }

        if(this.location.y + this.sh() > height || this.location.y  - this.sh() < 0){
            // this.setRandomColor();
            this.velocity.y *= -1;
        }

        if(this.location.z > + this.sh() -200 || this.location.z  - this.sh() < -1000){
            // this.setRandomColor();
            this.velocity.z *= -1;
        }

    }
}