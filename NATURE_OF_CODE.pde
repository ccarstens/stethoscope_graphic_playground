



ArrayList<Mover> mlist;

int total = 4000;

String flag = "MOUSE";

void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);



    mlist = new ArrayList<Mover>();
    
    addMovers(total);
    
}



void draw(){
    background(0);
    dropLine();

    // pushMatrix();
    // scale(0.5);
    // translate(width / 2, height / 2);
    
    for(int i = 0; i < mlist.size(); i++){
        mlist.get(i).render(flag);
    }
    


    // popMatrix();


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


void addMovers(int count){
    for(int i = 0; i < count; i++){
        Mover m = new Mover();
        m.setRandomLocation();
        mlist.add(m);
    }
}





void mousePressed(){
    addMovers(50);
    println(mlist.size());

}

void keyPressed(){
    
    if(key == CODED){
        if(keyCode == UP){

            flag = "RANDOM";

        }
    }
}

void keyReleased(){
    flag = "MOUSE";
}


