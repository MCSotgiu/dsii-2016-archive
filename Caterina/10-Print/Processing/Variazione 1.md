#Erba 
*Prima variazione codice 10-Print, tenendo premuto il mouse si creano dei triangoli verdi (simili ai fili d'erba) e tenendo premuto questi diventano sempre più grandi e con un bordo più scuro*


##CODICE
int spessorelinea= 1;
int w = 16;
int h = 16;
int index = 0;


void setup() {
 size(640, 384);
 background(#00ff4e);
 smooth();
}// setup


void draw() {
  
   stroke( #0a8704, random(0,255));
 strokeWeight(spessorelinea);
 int x1 = w*index;
 int x2 = x1 + w;
 int y1 = h*23;
 int y2 = h*24;
 
  if (mousePressed == true) {
    spessorelinea++ ;
    triangle(x2, y1, x1, y2, x1+17, y2);
    fill(#0fd105);
  } //if
  
 else if(mousePressed== false) {
   spessorelinea=1;
}//else if
 
 else if (random(2) < 1) {
 line(x2, y1, x1, y2);
 } //else if
 
 else {
 line(x1, y1, x2, y2);
 }//else
 
 index++;
 
 if (index == width/w) {
 PImage p = get(0, h, width, h*23);
 background(#00ff4e);
 set(0, 0, p);
 index = 0;
 }//if
}//drow
