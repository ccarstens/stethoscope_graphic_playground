



ArrayList<Mover> mlist;

int total = 1000;



void setup(){

    background(255);
    size(1200, 800, P2D);
    frameRate(30);



    mlist = new ArrayList<Mover>();
    
    for(int i = 0; i < total; i++){
        Mover m = new Mover();
        m.setRandomLocation();
        mlist.add(m);
    }
    
}



void draw(){
    background(0);
    dropLine();

    // pushMatrix();
    // scale(0.5);
    // translate(width / 2, height / 2);
    for(int i = 0; i < mlist.size(); i++){
        mlist.get(i).next();
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







