/*
 Hanbyul Jo, 2012 
 This Sketch is based on  'Text Universe by Tiemen Rapati 2010' You can find his original code in openprocessing.org 
 
 */

//import processing.opengl.*;
//import javax.media.opengl.*;
import peasy.*;

// camera

Scroller ease;
PeasyCam cam;


//String configFile = "data/quadsconfig.txt";
//ProjectedQuads projectedQuads;
//PGraphics quadGraphics;


float focusx = 0;
float focusy = 0;
float focusz = 0;

boolean is_mousecontrolled = false;
boolean mousedragged;
boolean dropping = false;
// content

PImage quadImage;

int index = 0;
String[] txt;
String[] words;
String[] firstWord;

Orbital[] planets;
PVector[] stars;
Orbital first;
Orbital countdown; 

PFont font;

Clock clock;


int aaa;


void setup() {

  noCursor();
  println("\nUse standard peasycam controls to manipulate camera:");

 // size(displayWidth, displayHeight, OPENGL);
  size(800,600,OPENGL);
  hint(DISABLE_OPENGL_ERRORS);     //it is just for speeding up !  it is a bit danger becaue it ignores the errors.

  // setting up camera & (partially obsolete) easing object

  ease = new Scroller(1, 1, 1, 0);
  cam = new PeasyCam(this, 1500);

  cam.setMinimumDistance(1);
  cam.setMaximumDistance(50000);


  //countdown clock

  clock = new Clock();
  
  clock.set(100.f,100.f,100.f);


  // setting up text object & typography

  txt = loadStrings("test.txt");
  firstWord = split(loadStrings("first.txt")[0], " ");

  // font = loadFont("GillSans-40.vlw");
  font = loadFont("Courier-Bold-60.vlw");
  textFont(font, 35);

  // setting up the planet array

  planets = new Orbital[txt.length];
  stars = new PVector[15000];


  float psize = 50;
  float oradius = 500;


  first = new Orbital(psize, 700, 0, 0, 0);


  for (int i=0; i< planets.length; i++) {

    words = split(txt[i], " ");
    int tempW = words.length;

    planets[i] = new Orbital(100, tempW*30, random(-8000, 8000), random(-8000, 8000), random(-8000, 8000));      

    for (int w = 0; w <words.length; w++) {
      Orbital oi = new Orbital(planets[i], words[w]);
      planets[i].children = (Orbital[]) append(planets[i].children, oi);
    }
  }



  countdown = new Orbital(100, 100, 0, 0, 0);
  Orbital oi = new Orbital(countdown, " ");
  first.children = (Orbital[]) append(countdown.children, oi);



  //just for decoration
  for (int i=0; i < stars.length; i++) {

    stars[i] = new PVector(random(-10000, 10000), random(-10000, 10000), random(-10000, 10000));
  }
}



void draw() {

  aaa+=100;
  background(0);

  ease.update(); // updates the ease' point coordinates with user input
  cam.pan(ease.h_vector, ease.v_vector);


  for (int i=0; i < stars.length; i++) {
    PVector p = stars[i];
    text('*', p.x, p.y, p.z);
  }


  for (int i=0; i< planets.length; i++) {
    planets[i].txt  = clock.getTime();

    planets[i].update(planets[i].x, planets[i].y, planets[i].z, false);
    planets[i].draw();
  
}

  //fill(255,0,0);
  first.update(0, 0, 0, false);
  first.draw();


  //countdown clock! FUCK TT

  countdown.update(cam.getPosition()[0], cam.getPosition()[1], cam.getPosition()[2], false);
  
  first.txt = clock.getTime();


textFont(font,90);


  countdown.draw();
  
  textFont(font,35);
  
  

  //println(cam.getPosition()[0] + "   " + countdown.x);


  //clock.draw();
}


void mouseClicked() {

//going to next planet
  
  if (index < 15) {
    cam.lookAt(planets[index].x, planets[index].y, planets[index].z, planets[index].rad +random(50,200), 5000);

  } 
  index++;

  if (index == 15                                                                                                                                                                                                                                              )  cam.lookAt(first.x, first.y, first.z, planets[index].rad-200 , 3000);

  println(index +"x: "+planets[index].x+" y ; "+ planets[index].y+" z : " +planets[index].z);
  //println(cam.getPosition()[0]);
  
}


void keyPressed(){
 
 
 if(keyCode==UP){
  
  
   //println("left");
  
 } 
  
  
}

//
//void mouseDragged() {
//  mousedragged = true;
//}
//
//void mouseReleased() {
//  mousedragged = false;
//  
//  if (!is_mousecontrolled) {
//    // breaks, unstable
//  }
//  
//}

