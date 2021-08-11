import fisica.*;

FWorld mundo;

ArrayList <Cajas> pared;
Cajas paleta1, paleta2;

Obstaculo obstaculo;
ArrayList <Obstaculo> obstaculos;

Pelota pelota;
Triangulos rebote1, rebote2, rebote3, rebote4;

PImage  imagen_pelota_basket;
void setup() {
  size(600, 800);

  Fisica.init(this);

  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0, 1000); //gravedad


  obstaculos = new ArrayList <Obstaculo> ();
  for (int i = 0; i < 3; i++) //cantidad de obstaculos
  {
    Obstaculo obstaculo = new Obstaculo(50); //tamaño
    obstaculo.inicializar(i* 40 + random(150, 450), i * 50 + random(150, 350)); //ubicacion de los obstaculos
    mundo.add(obstaculo);
    obstaculos.add(obstaculo);
  }

  pared = new ArrayList <Cajas> ();
  for (int i = 0; i < 2; i++) //cantidad 
  {
    Cajas p = new Cajas(5, 560); //tamaño
    p.inicializar(i * 480 + 60, 480); //ubicacion desde el centro
    mundo.add(p);
    pared.add(p);
  }

  //der
  paleta1 = new Cajas(20, 160);
  paleta1.inicializarPaletas(385, 700); //ubicacion y rotacion
  mundo.add(paleta1);

  //izq 
  paleta2 = new Cajas(20, 160);
  paleta2.inicializarPaletas(215, 700); //ubicacion y rotacion
  mundo.add(paleta2);

  imagen_pelota_basket = loadImage("pelota_basket2.png");

  //Triangulo superior izq
  rebote1  = new Triangulos(525, 0, 600, 0, 600, 75); //vertices
  rebote1.inicializar(); //ubicacion desde el centro
  mundo.add(rebote1);

  //Triangulo superior der
  rebote2  = new Triangulos(0, 0, 150, 0, 0, 150); //vertices
  rebote2.inicializar(); //ubicacion desde el centro
  mundo.add(rebote2);

  //Triangulo inferior izq
  rebote3  = new Triangulos(150, 620, 90, 550, 90, 450); //vertices
  rebote3.inicializar(); //ubicacion desde el centro
  mundo.add(rebote3);
  
   //Triangulo inferior der
  rebote4  = new Triangulos(450, 620, 510, 550, 510, 450); //vertices
  rebote4.inicializar(); //ubicacion desde el centro
  mundo.add(rebote4);
}

void draw() {

  fill(50, 100, 150);
  rect(0, 0, width, height);

  paleta1.actualizarPaletaDer();
  paleta2.actualizarPaletaIzq();

  mundo.step();
  mundo.draw();

  println(mouseX, mouseY);
} 

void keyPressed() {

  if (key == 'd' || key == 'D') {
    paleta1.derPresionado = true;
  }

  if (key == 'a' || key == 'A') {
    paleta2.izqPresionado = true;
  }
  if (key == ' ' ) {
    pelota = new Pelota(30);
    pelota.inicializar(570, 800);
    mundo.add(pelota);
  }
}
void keyReleased() {
  if (key == 'd' || key == 'D') {
    paleta1.derPresionado = false;
  }

  if (key == 'a' || key == 'A') {
    paleta2.izqPresionado = false;
  }
}
