var x = 0;  // store current x position on the grid
var y = 0;  // store current y position on the grid
var g = 10; // grid size
var colore = 255; // current grid color
var ciclo=1;

function setup() {
   pixelDensity(displayDensity());
   createCanvas(windowWidth, windowHeight);
   url = getURL();
   //strokeJoin(ROUND);
   cursor(HAND);
   ellipseMode(CENTER);
 }

function draw() {
  //background(colore-255); solo una linea che avanza
    strokeWeight(g/random(5));
    stroke(colore);

  // lancio la monetina e disegno 
  if (testa()) {
 
if (ciclo==1){
  //variante linee
      line(x*g,y,x*g,height); //linee dritte
 //variante linee
}
if (ciclo==2){
   //variante cerchio
      ellipse(x*g,height/2,x+g,x+g); //cerchio al centro 
 //variante cerchio
}
if (ciclo==3){

    //variante cerchio Random
      ellipse(x*g,height-random(height),x+g,x+g); //cerchio al centro 
 //variante cerchio Random
}
      // passo alla casella a lato
  x++;

  }  // lancio la monetina e disegno 


  // se sono in fondo alla riga vado a capo, cambio colore e cambia g
  if (x*g >= width) {
    ciclo++;
    x=0;
    colore = random(255); 
    g = 5+random(20);
    background(colore-255);
  }
  if (ciclo>= 4) {
    ciclo=1;
  } 
  } //chiudi draw

// riparti se premi il mouse
function mousePressed() {
  ciclo++;
  x=0;
  y=0;
  colore = random(255);
  g = 10+random(20);
}

// lancio della monetina
function testa() {
  if (random(2) <= 1) {
    return(true); // testa
  } else {
    return(false); // croce
  }
}


// se ridimensiona la finestra ricalcola width e height canvas
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

// se premi "s" salva come immagine
function keyTyped() {
  if (key === 's') {
    saveCanvas();
  }
  return false;
}
