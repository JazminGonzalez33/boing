class Obstaculo extends FCircle  {
    Obstaculo(float _r) {
    super(_r);
  }
  void inicializar(float _x, float _y) {
    setName ("obstaculo");
    setPosition(_x, _y);
    setStatic(true);
  //  setGrabbable(false);
  }
}
