# Flash in the dark
*Questa variazione crea una trama di "luci" colorate verso il basso che al click del mouse diventano più intense e verso l'alto.*



##CODICE

float spessorelinea=1;
int w = 16;
int h = 16;
int index = 0;
float counter;
PImage p;




void setup() {
  size(640, 384);
  background(#000000);
  smooth();
  counter=0.0;
}// setup


void draw() {
  int r= int (random(0, 255));
int g= int (random(0, 255));
int b= int (random(0, 255));
  float colorecasuale= random(0, 255);
 

  strokeWeight(spessorelinea);

  //variabili
  float l= random(320); //variabile l
  float variabilel= l++;
  float m= random(20);//variabile m
  float variabilem= m;
  //variabili

  int x1 = w*index;
  float x2 = x1 +variabilel;
  float y1 = h*h;
  float y2 = h*24;

  //if mouse pressed
  if (mousePressed == true) {
      stroke(r,g,b);
    spessorelinea=(random(3)) ;

    //triangoli invece che linee

    /* triangle(x2++, variabilem, variabilel, y1, variabilem, y2);
     fill(#0fd105);
     rotate(2);
     */

    //linee verso l'alto

    if (random(2) < 1) {
      line(variabilem, y1, x1, -variabilel);
    } else {
      line(variabilem+620, y1, x1, -variabilem);
    }
  }
  //if mouse pressed


  //if mouse released
  if (mousePressed== false) {
          stroke(r,g,b,10);
    spessorelinea=random(5);
    
    //linee verso il basso
    
    if (random(2) < 1) {
      line(variabilem, y1, x1, y2+l);
    } else {
      line(variabilem+620, y1, x1, y2+m);
      //line(x1, y1, x2, y2);
    }
  }
  //if mouse released
  
//aumenta index++ ongni volta
  index++;
  
//copia e incolla la linea su
  if (index == width/w) {

    PImage p = get(0, h, width, h*23);
    background(#000000);
    set(0, 0, p);
    index = 0;
  }
}
