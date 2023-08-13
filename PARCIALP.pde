int currentPage = 0;  // Página actual (inicialmente la página 1)
PFont font1, font2, font3;
PImage Title, ABAJO, Lab, Paisa, laberinto, youw, fondo, pesca;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
int x;
int y;
int ellipseSpeed = 8;
boolean victory = false;
color fishColor;
int Negro;
void setup() {
size(500, 500);
Title = loadImage("Title.png");
ABAJO = loadImage("ABAJO.png");
Lab = loadImage("Lab.jpg");
Paisa = loadImage("Paisa.png");
fondo = loadImage("fondo.jpg");
pesca = loadImage("pesca.jpg");
background(#FAEBD7);
laberinto = loadImage("Laberinto.png");
  youw = loadImage("youw.gif");
  minim = new Minim(this);
  player = minim.loadFile("cancion.mp3");
  x = 250;
  y = 40;
  fishColor = color(148, 0, 30);
}

void draw() {
 background(220);
  
  // Dibuja el contenido de la página actual
  if (currentPage == 0) {
 image(Title,0,0); 
image(ABAJO,0,380);
image(Lab,75,390);
image(Paisa,230,390);
image(pesca,400,390);
textSize(44);
textAlign(CENTER, CENTER);
line(0, 140, width, 140);
strokeWeight(6);
stroke(#CBC3B7);
line(0, 190, width,190);
strokeWeight(6);
stroke(#CBC3B7);
font1 = loadFont ("NSimSun-48.vlw");
textFont(font1, 48);
fill(#CBC3B7);
text("Bienvenidos", 250, 160);
font2 = loadFont ("ArialMT-48.vlw");
fill(0);
textFont(font2, 15);
text("En este programa se te presentaran 3 opciones, elije tu favorita", 250, 250);
font3 = loadFont ("NSimSun-48.vlw");
textFont(font3, 48);
fill(#CBC3B7);
text("PRACTICA PARCIAL #1", 245, 50);

  } else if (currentPage == 1) {
    drawPage1();
  } else if (currentPage == 2) {
    drawPage2();
  }else if (currentPage == 3) {
    drawPage3();
  }
  
  // Dibuja los botones de selección de página
  drawPageButtons();
}

void drawPage1() {
  // Contenido de la página 1
   background(316);
   int numTriangles =1000;
  ellipse(100,100,150,150);
  fill(245,238,15);
  strokeWeight(8);
  stroke(222,137,25);
  for (int i = 0; i < numTriangles; i++){
    int x1 = int(random(width));
    int y1 = int(random(height));
    int x2 = int(random(width));
    int y2 = int(random(height));
    int x3 = int(random(width));
    int y3 = int(random(height));
    
    fill(47,65,245);
    stroke(#070C5F);
    
    // Dibujamos el triángulo
    triangle(x1, y1, x2, y2, x3,y3);
    
    fill(255,255,0);
    stroke(50);
    stroke(#F5B32F);
    ellipse(380,50, 200, 200);
    
    fill(#0D830E);
    stroke(#055A06);
    stroke(50);
    rect(0,350,498,200);
    
    fill(#744904);
    rect(15,320, 50,150);
    
    fill(#48F75E);
    stroke(25);
    stroke(#0B8B1B); 
    ellipse(42,310,100,100);//
    
    fill(#744904);
    rect(250,370, 50,150);
    fill(#48F75E);
    stroke(25);
    stroke(#0B8B1B); 
    ellipse(270,374,100,100);
}
}

void drawPage2() {
  // Contenido de la página 2
  image(laberinto,5,5);
 stroke(#E81C1C);
 strokeWeight(8);
 noFill();
 ellipse(x,y,20,20);
 Negro = get(x,y);
 println(Negro);

 if(Negro== -16777216){
   x = 250;
   y = 40;
 }
 if (y > 500){
 victory = true;
 } if (victory){
   image(youw,5,5);
 }
}
void keyPressed(){
  if(!victory){
  if(keyCode == UP){
    y -= ellipseSpeed;
  } else if (keyCode == DOWN){
     y += ellipseSpeed;
  player.play();
  } else if (keyCode == LEFT){ 
    x -= ellipseSpeed;
  } else if (keyCode == RIGHT){
    x += ellipseSpeed;
  } 
}
}
void drawPage3() {
  // Contenido de la página 3
  image(fondo,0,0); 
  fishColor = lerpColor(color(148, 0, 30), color(0, 191, 30), frameCount / 120.0);
  drawFish(width / 2, height / 2, fishColor);
}
void drawFish(float x, float y, color fishColor) {
  fill(fishColor); // Color del pez (cambia de morado a celeste)
  noStroke();
  ellipse(x, y, 300, 300); // Cuerpo del pez
  fill(250);
  ellipse(x + 100, y + 10, 80, 80);
  fill(0);
  ellipse(x + 100, y + 10, 40, 40);
  
  fill(fishColor); 
  triangle(x - 150, y, x - 290, y - 125, x - 290, y + 125); 
}

void drawPageButtons() {
  // Dibuja los botones para seleccionar página
  for (int i = 1; i <= 3; i++) {
    if (i == currentPage) {
      fill(150);
    } else {
      fill(200);
    }
    
    
    
    rect(150 * i - 50, 350, 40, 20);
    fill(0);
    text(i, 150 * i, 365);
  }
}

void mousePressed() {
  // Verifica si se hizo clic en uno de los botones de selección de página
  for (int i = 1; i <= 3; i++) {
    if (mouseX > 150 * i - 50 && mouseX < 150 * i - 10 && mouseY > 350 && mouseY < 370) {
      currentPage = i;
      break;
    }
  }
}
