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





Settings def = new Settings(this);
STAudioInputController stethoscopeController;




int total = 10;
int startX = 50;
int startY = 50;

int spacing = 10;

float gb = 0;
float colorStep;
int colorFadeDuration = 1;

void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);

    // GravityBehavior2D gb = new GravityBehavior2D(new Vec2D(0, 0.5));
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring2D>();

    physics = new VerletPhysics2D();
    physics.setWorldBounds(new Rect(0, 0, width, height));
    physics.addBehavior(new GravityBehavior2D(new Vec2D(-5, 0)));

    wind = new ConstantForceBehavior2D(new Vec2D(-0.1, 0));


    colorStep = 255 / (frameRate * colorFadeDuration);

    // physics.addBehavior(wind);
    int x = startX;
    int y = startY;

    for(int i = 0; i < total; i++){
        Particle tmp = new Particle(new Vec2D(x, y));
        particles.add(tmp);
        physics.addParticle(tmp);

        if(i != 0){
            Particle prev = particles.get(i - 1);
            VerletSpring2D spring = new VerletSpring2D(prev, tmp, spacing, 0.01);
            physics.addSpring(spring);
            springs.add(spring);

        }

        x += spacing;
    }

    // particles.get(1).lock();


    stethoscopeController = new STAudioInputController(def);

}


void draw(){
    background(0);
    // dropLine();
    
    physics.update();
    bindLast();
    noFill();
    stroke(255, gb, gb);
    
    strokeWeight(70);
    strokeCap(SQUARE);
    beginShape();
    for(Particle p: particles){
        curveVertex(p.x, p.y);
    }
    endShape();

    for(Particle p: particles){
        // p.display();
    }


    if(gb > 255 || gb < 0){
        colorStep *= -1;
    }

    // gb += colorStep;
    println(gb);

    

}

void bindLast(){
    Particle p = particles.get(particles.size() - 2);
    p.lock();
    p.x = 1300;
    float[] sampleAverage = stethoscopeController.getAudioMappedTo(800, 1);
    p.y = sampleAverage[0];
    p.unlock();
}



void mouseMoved(){
    float x = map(mouseX, 0, width, 1, -1);
    float y = map(mouseY, 0, height, 1, -1);
    wind.setForce(new Vec2D(x, y));


}

void mousePressed(){
    Particle p = particles.get(1);
    // p.unlock();
    p.x = mouseX;
    p.y = mouseY;
    // p.lock();
}