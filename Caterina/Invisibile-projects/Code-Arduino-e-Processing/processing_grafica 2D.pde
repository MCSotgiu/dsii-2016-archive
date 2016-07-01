import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float valore;
float traY=0, rotX=0;

//array di valori

IntList Valori;
int totaleValori = 60;

IntList ValoriTemp;
int totaleValoriTemp=120;

float secondi;
float ora = 0;
int radius= 0;
int raggio;
int raggiob=raggio/8;
//int v = raggio;

void setup() {

  // Reed port value.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  println(Serial.list());
 myPort = new Serial(this, portName, 9600);

  Valori = new IntList(); //valori è un nuovo array
  ValoriTemp = new IntList(); //nuovo array

  size(1000, 1000);
  background(0);
  stroke(255);
  noFill();
}

void draw() {
  strokeWeight(5);
  //background(0);
  //dammi un valore di media dei valori di ogni secondo
  secondi = millis()/1000;
  if (secondi-ora >= 1) {
    media();
  } 
  ora = secondi;

//mappa i valori di arduino con una dimensione
  for (int i=0; i<Valori.size(); i++) {
    int raggio = (int) map(Valori.get(i), 0, 2000, 0, height/2);
  //ellipse(width/2, height/2, raggio*2, raggio*2);

}
/*for(int i=0; i<Valori.size(); i++){
  //int radius = (int) map(Valori.get(i), 0, 2000, 0,height/2);
beginShape();
float x = cos( radians( i * 12 ) ) * radius;
float y = sin( radians( i * 12 ) ) * radius;
        vertex( cos( radians( i * 6 ) ) * (radius-50)+width/2, sin( radians( i * 6 ) ) * (radius-50)+height/2 );
        //vertex( cos( radians( i * 6 ) ) * (radius/2)+width/2, sin( radians( i * 6 ) ) * (radius/2)+height/2 );
        //vertex( x+10+width/2, y+10+height/2 );
endShape();
  }*/
  
  for(int i=0; i<ValoriTemp.size(); i++){
  //int raggiob = (int) map(Valori.get(i), 100, 2000, 0,height/8);
beginShape();
float x = cos( radians( i * 6 ) ) * raggiob;
float y = sin( radians( i * 12 ) ) * raggiob;
        vertex( cos( radians( i * 6 ) ) * (radius-50)+width/2, sin( radians( i * 6 ) ) * (radius-50)+height/2 );
        //vertex( cos( radians( i * 6 ) ) * (radius/2)+width/2, sin( radians( i * 6 ) ) * (radius/2)+height/2 );
        //vertex( x+10+width/2, y+10+height/2 );
endShape();
  }

  
 
 
}

//fai la media
void media() {
  int somma = 0;
  for (int i=0; i<ValoriTemp.size(); i++) {
    somma+=ValoriTemp.get(i);
  }
  if (somma != 0 && ValoriTemp.size() >0) {
    int media = somma / ValoriTemp.size(); //media è la somma di tutti i ValoriTemp/ il numero di ValoriTemp
    Valori.append(media); 
    ValoriTemp.clear();
  }
}


void serialEvent (Serial myPort) {
  // get the ASCII string:
  String val = myPort.readStringUntil('\n');
  // trim off any whitespace:
  if (val != null) {
    val = trim(val);
    //else val ="0";
    
    // convert to an int
    radius = int(val);
    ValoriTemp.append(radius);
    if (ValoriTemp.size() >= totaleValoriTemp) {
      ValoriTemp.remove(0);
    }
    println(val);
  }
  // at the edge of the screen, go back to the beginning:
}

void mouseClicked() {
  background(0);
}

void keyPressed(){
  if(key == 's'){
   saveFrame("###.png");
   println("saved");
  }
    if(key == 'c'){
   background(255);
   background(0);
   clear();
  }
}