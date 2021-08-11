class Pelota extends FCircle {
  Pelota(float _r) {
    super (_r); //tamanio del circulo
  }

  void inicializar(float _x, float _y) {
    setName ("pelota");
    setPosition(_x, _y);
    attachImage(imagen_pelota_basket);
    setRestitution(1.0);  //rebote
    setGrabbable(false); //no se puede agarrar
    setFriction(100); //friccion cuando colicionan
    setDensity(10); //dencidad/masa/peso
    setVelocity(0, -1900);
  }
  
}
