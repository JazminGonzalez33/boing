class Triangulos extends FPoly {
  Triangulos(float _x, float _y, float _w, float _z, float _f, float _d) {
    super.vertex (_x, _y);
    super.vertex (_w, _z);
    super.vertex (_f, _d);
  }
  void inicializar() {
    setName ("rebotes");
    setStatic(true); //no cae, antigravedad
    setGrabbable(false); //no se puede mover con el mouse
  }
} 
