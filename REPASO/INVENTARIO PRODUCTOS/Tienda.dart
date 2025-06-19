class Tienda {
  static const nombre = 'PEDRITO';
  static String anuncio = 'Puede modificarse';
  static int _productoVendidos = 0;

  static void cambiarAnuncio(String mensaje) {
    anuncio = mensaje;
  }

  static void aumentarVentas() {
    _productoVendidos++;
  }

  static int obtenerVentas() {
    return _productoVendidos;
  }
}
