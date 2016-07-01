#Codice a barre
*Questa versione temporanea di 10 print.JS ha l'obbiettivo di simulare un codice a barre che si crea ogni volta che la pagina viene riempita. L'obiettivo è quello di creare un condice a barre basato sull'immagine che viene catturata dalla webcam, (trasformata in valore cromatico e addizionato allo stroke delle linee).*


###CODICE

// Codice a barre

var x = 0;  // store current x position on the grid
var y = 0;  // store current y position on the grid
var g = 10; // grid size
var colore = 255; // current grid color


function setup() {
   pixelDensity(displayDensity());
   createCanvas(windowWidth, windowHeight);
   //
   background(200);
   //
   url = getURL();
   //strokeJoin(ROUND);
   cursor(HAND);
 }

function draw() {
  preparaQuadretto();
  // riga proporzionale alla griglia
  strokeWeight(g/random(5));
  // lancio la monetina e disegno la riga corrispondente
  if (testa()) {
  line(x*g,y,x*g,height); //linee dritte
  //line(x*g,height-g*y,x*g+g,height/colore-g*y-g); //linee storte
  } else {
    //(x*g,height-g*y-g,x*g+g,height-g*y);
  }
  // passo alla casella a lato
  x++;
  // se sono in fondo alla riga vado a capo alla riga successiva
  if (x*g >= width) {
    x=0;
//se le righe arrivano in fondo ricomincia dall'inizio e lancia la moneta
    colore = random(255); 
    g = 5+random(width);
    background(colore-255);
    preparaQuadretto();

  //  y++;
    preparaQuadretto();
  }
  // se sono in fondo alla pagina ricomincio con colore e griglia differente
  /*if (y*g >= height) {
    y=0;
    colore = random(255);
    g = 5+random(width);
    preparaQuadretto();
  }*/
}

// riparti se premi il mouse
function mousePressed() {
  x=0;
  y=0;
  colore = random(255);
  g = 10+random(width);
  preparaQuadretto();
}

// lancio della monetina
function testa() {
  if (random(2) <= 1) {
    return(true); // testa
  } else {
    return(false); // croce
  }
}

// cancella una riga prima di disegnarci
function preparaRiga() {
  /*fill(colore);
  noStroke();
  rect(0,height-g*y-g-1,width,g+1);
  stroke(255-colore);*/
}

// cancella un quadretto prima di disegnarci
function preparaQuadretto() {
  /*fill(colore);*/
  noStroke();
  //rect(x*g,height-g*(y+1),g-1,g-1);
  //rect(x*g,height-g*(y+1),g-(g/20),g-(g/20));
  stroke(255-colore);
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
