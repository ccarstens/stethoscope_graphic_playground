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

int total = 20;
int startX = 50;
int startY = 50;

void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);

    // GravityBehavior2D gb = new GravityBehavior2D(new Vec2D(0, 0.5));
    particles = new ArrayList<Particle>();

    physics = new VerletPhysics2D();
    physics.setWorldBounds(new Rect(0, 0, width, height));
    physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));

    wind = new ConstantForceBehavior2D(new Vec2D(-0.1, 0));

    physics.addBehavior(wind);
    int x = startX;
    int y = startY;

    for(int i = 0; i < total; i++){
        Particle tmp = new Particle(new Vec2D(x, y));
        particles.add(tmp);
        physics.addParticle(tmp);
        x += 50;
    }
}


void draw(){
    background(0);
    // dropLine();
    physics.update();
    
    
    for(Particle p: particles){
        p.display();
    }

    

}



void mouseMoved(){
    float x = map(mouseX, 0, width, 1, -1);
    float y = map(mouseY, 0, height, 1, -1);
    wind.setForce(new Vec2D(x, y));
}