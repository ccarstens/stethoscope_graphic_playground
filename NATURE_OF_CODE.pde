
int total = 12;

float radius = 200;

float value;

ArrayList<Entity> list;
Attractor attractor;

void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);

    translate(width / 2, height / 2);

    list = new ArrayList<Entity>();

    for(int i = 0; i < total; i++){
        float p = TWO_PI / total * (i +1);
        float x = radius * cos(p);
        float y = radius * sin(p);
        list.add(new Entity(x, y));
    }
    attractor = new Attractor(0, 0, 10);
    
}


void draw(){
    background(0);
    // dropLine();
    translate(width / 2, height / 2);
    
    for(int i = 0; i < total; i++){
        float radiusValue = radius * value;
        float p = TWO_PI / total * (i +1);
        float x = radiusValue * cos(p);
        float y = radiusValue * sin(p);
        stroke(0);
        fill(255, 0, 0);
        ellipse(x, y, 20, 20);
    }

    

}


void mouseMoved(){
    value = map(mouseY, height, 200, 0, 1);
    println(value);
}



void dropLine(){




    pushMatrix();
    scale(0.5);
    translate(width / 2, height / 2);
    

    stroke(0);
    line(0, 0, width, 0);
    line(width, 0, width, height);
    line(width, height, 0, height);
    line(0, height, 0, 0);

    popMatrix();
}



