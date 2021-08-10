import fisica.*;

FWorld mundo;
FCircle obstaculo1, obstaculo2;


FPoly paletas1, paletas2;

ArrayList <Cajas> pared;
Cajas paleta1, paleta2;

Obstaculo obstaculo;
ArrayList <Obstaculo> obstaculos;

PImage imagen_pelota_futbol, imagen_pelota_basket;
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

  paleta1 = new Cajas(20, 150);
  paleta1.inicializarPaletas(385, 700, 45); //ubicacion y rotacion
  mundo.add(paleta1);
  pared.add(paleta1);

//der
  paleta2 = new Cajas(20, 150);
  paleta2.inicializarPaletas(215, 700, 90); //ubicacion y rotacion
  mundo.add(paleta2);
  pared.add(paleta2);

  imagen_pelota_basket = loadImage("pelota_basket2.png");

  /*paletas1 = new FPoly();
   paletas1.vertex(150, 690);
   paletas1.vertex(130, 720);
   paletas1.vertex(280, 735);
   paletas1.setStatic(true); //no cae, antigravedad
   paletas1.setGrabbable(false); //no se puede mover con el mouse
   mundo.add(paletas1);
   
   paletas1 = new FPoly();
   paletas1.vertex(450, 690);
   paletas1.vertex(320, 735);
   paletas1.vertex(470, 720);
   paletas1.setStatic(true); //no cae, antigravedad
   paletas1.setGrabbable(false); //no se puede mover con el mouse
   mundo.add(paletas1);
   */

  paletas1 = new FPoly();
  paletas1.vertex(525, 0);
  paletas1.vertex(600, 0);
  paletas1.vertex(600, 75);
  paletas1.setStatic(true); //no cae, antigravedad
  paletas1.setGrabbable(false); //no se puede mover con el mouse
  mundo.add(paletas1);

  paletas1 = new FPoly();
  paletas1.vertex(0, 0);
  paletas1.vertex(150, 0);
  paletas1.vertex(0, 150);
  paletas1.setStatic(true); //no cae, antigravedad
  paletas1.setGrabbable(false); //no se puede mover con el mouse
  mundo.add(paletas1);
}

void draw() {

  fill(50, 100, 150);
  rect(0, 0, width, height);

  //paletasReposo();

  paleta1.actualizar();
  paleta2.actualizar();

  mundo.step();
  mundo.draw();

  //println(mouseX, mouseY);
} 
//getAngularVelocity()  boolean  isSleeping() void  setAllowSleeping(boolean allowSleep)  void  setAngularDamping(float damping)  void  setRotation(float w)
void keyPressed() {
  if (key == ' ' ) {
    FCircle circulo= new FCircle(30);
    circulo.setPosition(570, 800);
    circulo.attachImage(imagen_pelota_basket);
    circulo.setRestitution(1.0);  //rebote
    circulo.setGrabbable(false); //no se puede agarrar
    circulo.setFriction(100); //friccion cuando colicionan
    circulo.setDensity(100); //dencidad/masa/peso
    circulo.setVelocity(0, -1900);  
    mundo.add(circulo);
  }

  if (key == RIGHT) {
    paleta2.derPresionado = true;
  }

  if (key == LEFT) {
    paleta1.izqPresionado = true;
  }
}
 void keyReleased(){
 if (key == RIGHT) {
    paleta2.derPresionado = false;
  }

  if (key == LEFT) {
    paleta1.izqPresionado = false;
  }
 }
