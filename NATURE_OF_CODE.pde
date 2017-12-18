// import toxi.audio.*;
// import toxi.color.*;
// import toxi.color.theory.*;
// import toxi.data.csv.*;
// import toxi.data.feeds.*;
// import toxi.data.feeds.util.*;
// import toxi.doap.*;

// import toxi.geom.mesh.*;
// import toxi.geom.mesh.subdiv.*;
// import toxi.geom.mesh2d.*;
// import toxi.geom.nurbs.*;
// import toxi.image.util.*;
// import toxi.math.*;
// import toxi.math.conversion.*;
// import toxi.math.noise.*;
// import toxi.math.waves.*;
// import toxi.music.*;
// import toxi.music.scale.*;
// import toxi.net.*;
// import toxi.newmesh.*;
// import toxi.nio.*;


// import toxi.physics2d.constraints.*;
// import toxi.physics3d.*;
// import toxi.physics3d.behaviors.*;
// import toxi.physics3d.constraints.*;
// import toxi.processing.*;
// import toxi.sim.automata.*;
// import toxi.sim.dla.*;
// import toxi.sim.erosion.*;
// import toxi.sim.fluids.*;
// import toxi.sim.grayscott.*;
// import toxi.util.*;
// import toxi.util.datatypes.*;
// import toxi.util.events.*;
// import toxi.volume.*;



import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;


void setup(){

    background(255);
    size(1500, 1000, P2D);
    frameRate(30);

    physics = new VerletPhysics2D();
    physics.setBounds(new Rect(0, 0, width, height));
    physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));

}


void draw(){
    background(0);
    // dropLine();
    physics.update();
    

    

}