import toxi.audio.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.data.csv.*;
import toxi.data.feeds.*;
import toxi.data.feeds.util.*;
import toxi.doap.*;

import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.geom.nurbs.*;
import toxi.image.util.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.music.*;
import toxi.music.scale.*;
import toxi.net.*;
import toxi.newmesh.*;
import toxi.nio.*;


import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;
import toxi.sim.automata.*;
import toxi.sim.dla.*;
import toxi.sim.erosion.*;
import toxi.sim.fluids.*;
import toxi.sim.grayscott.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.volume.*;




import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Particle p;

ConstantForceBehavior2D wind;

ArrayList<Particle> particles;
ArrayList<VerletSpring2D> springs;


ArrayList<ArrayList<Particle>> grid;

int sizeX = 20;
int sizeY = 20;


int total = 10;
int startX = 200;
int startY = 50;

int spacing = 20;

float gb = 0;
float colorStep;
int colorFadeDuration = 1;

float strength = 0.1;

PImage img;

float imgWidthStep, imgHeightStep;

void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);

    // GravityBehavior2D gb = new GravityBehavior2D(new Vec2D(0, 0.5));
    grid = new ArrayList<ArrayList<Particle>>();
    springs = new ArrayList<VerletSpring2D>();

    physics = new VerletPhysics2D();
    physics.setWorldBounds(new Rect(0, 0, width, height));
    physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 1)));

    wind = new ConstantForceBehavior2D(new Vec2D(-0.1, 0.1));


    

    // physics.addBehavior(wind);
    int x = startX;
    int y = startY;

    for(int i = 0; i < sizeY; i++){
        ArrayList<Particle> tmpList = new ArrayList<Particle>();
        x = startX;
        for(int ii = 0; ii < sizeX; ii++){
            Particle tmpParticle = new Particle(new Vec2D(x, y));
            physics.addParticle(tmpParticle);
            tmpList.add(tmpParticle);
            x += spacing;

            if(i != 0){
                Particle prevRowParticle = grid.get(i - 1).get(ii);
                VerletSpring2D tmpSpring = new VerletSpring2D(prevRowParticle, tmpParticle, spacing, strength);
                springs.add(tmpSpring);
                physics.addSpring(tmpSpring);
            }

            if(ii != 0){
                Particle prev = tmpList.get(ii - 1);
                VerletSpring2D tmpSpring = new VerletSpring2D(prev, tmpParticle, spacing, strength);
                springs.add(tmpSpring);
                physics.addSpring(tmpSpring);
            }
        }

        grid.add(tmpList);
        y += spacing;
    }


    grid.get(0).get(0).lock();
    grid.get(0).get(grid.get(0).size() - 1).lock();


    img = loadImage("receipt.png");

    imgWidthStep = img.width / sizeX;
    imgHeightStep = img.height / sizeY;

    
}

void setTopRight(int x, int y){

    Particle bottomLeft = grid.get(sizeY - 1).get(0);
    Particle bottomRight = grid.get(sizeY - 1).get(sizeX - 1);
    bottomLeft.lock();
    bottomRight.lock();


    Particle topRight = grid.get(0).get(sizeX - 1);
    topRight.x = x;
    topRight.y = y;

    bottomLeft.unlock();
    bottomRight.unlock();
}


void draw(){
    background(0);
    // dropLine();
    
    physics.update();


    // for(ArrayList<Particle> plist: grid){
    //     for(Particle p: plist){
    //         p.display();
    //     }
    // }


    // Particle bottomRight = grid.get(sizeY - 1).get(sizeX - 1);
    // bottomRight.lock();
    // bottomRight.x = mouseX;
    // bottomRight.y = mouseY;
    // bottomRight.unlock();

    // stroke(255);
    noStroke();
    noFill();

    beginShape();
    texture(img);

    for(int i = 0; i < sizeX; i++){
        Particle ptop = grid.get(0).get(i);
        vertex(ptop.x, ptop.y, imgWidthStep * i, 0);
    }

    for(int i = 0; i < sizeY; i++){
        Particle pright = grid.get(i).get(sizeX - 1);
        vertex(pright.x, pright.y, img.width, imgHeightStep * i);
    }

    for(int i = sizeX - 1; i >= 0; i--){
        Particle pbottom = grid.get(sizeY - 1).get(i);
        vertex(pbottom.x, pbottom.y, imgWidthStep * i, img.height);
    }
    for(int i = sizeY - 1; i >= 0; i--){
        Particle pleft = grid.get(i).get(0);
        vertex(pleft.x, pleft.y, 0, imgHeightStep * i);
    }

    endShape(CLOSE);

    

}

void mousePressed(){
    setTopRight(mouseX, mouseY);
}

