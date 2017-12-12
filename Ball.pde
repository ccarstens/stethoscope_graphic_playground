class Ball{
    PVector location, velocity;

    color c;

    Ball(float lx, float ly, float lz, float vx, float vy, float vz){
        this.location = new PVector(lx, ly, lz);
        this.velocity = new PVector(vx, vy, vz);
        this.setRandomColor();
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
        ellipse(0, 0, 30, 30);
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

    void checkEdges(){
        if(this.location.x > width || this.location.x < 0){
            // this.setRandomColor();
            this.velocity.x *= -1;
        }

        if(this.location.y > height || this.location.y < 0){
            // this.setRandomColor();
            this.velocity.y *= -1;
        }

        if(this.location.z > 200 || this.location.z < -1000){
            // this.setRandomColor();
            this.velocity.z *= -1;
        }

    }
}