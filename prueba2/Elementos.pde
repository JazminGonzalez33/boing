class Cajas extends FBox {
  Boolean izqPresionado, derPresionado; //banderas, funciones controlables

  Cajas(float _w, float _h) {
    super(_w, _h);
  }
  void inicializar(float _x, float _y) {
    setName ("paredes");
    setPosition(_x, _y);
    setStatic(true);
    setGrabbable(false);
  }
  void inicializarPaletas(float _x, float _y, float _r) {

    izqPresionado = false;
    derPresionado = false;

    setName ("paletas");
    setPosition(_x, _y); //lo agrego como parametro
    setStatic(true);
    setRotation(_r);
    setGrabbable(false);
    setRotatable(false);
  }

  void actualizar() {
  println(izqPresionado);
    if (izqPresionado) { //arribaPresionado
   setVelocity(getVelocityX(), -220);//setVelocity no atraviesa los objetos
    }
    if (derPresionado) { //arribaPresionado
       setVelocity(getVelocityX(), -220);//setVelocity no atraviesa los objetos
    }
  }
}
