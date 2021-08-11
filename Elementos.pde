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
  void inicializarPaletas(float _x, float _y) {

    izqPresionado = false;
    derPresionado = false;

    setName ("paletas");
    setPosition(_x, _y); //lo agrego como parametro
    setStatic(true);
    //setRotation(_r);
    setGrabbable(false);
    setRotatable(false);
  }

  void actualizarPaletaDer() {
  //  println(derPresionado);
    if (derPresionado) { //arribaPresionado
      // setVelocity(380, 700);//setVelocity no atraviesa los objetos
      setRotation(90);
    } else {
      setRotation(45);
    }
  }
  
    void actualizarPaletaIzq() {
    //println(derPresionado);
    if (izqPresionado) { //arribaPresionado
      // setVelocity(380, 700);//setVelocity no atraviesa los objetos
      setRotation(45);
      addForce(316,740,385,700);
    } else {
      setRotation(90);
    }
  }
}
