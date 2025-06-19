class Taller {
  static const String nombre = 'Taller unico';
  static String mensajeBienvenida = 'Bienvenidos a todos';
  static int _totalReparaciones = 0;

  static void cambiarMensaje(String mensaje) {
    mensajeBienvenida = mensaje;
  }

  static void incrementarContador() {
    _totalReparaciones++;
  }

  static int obtenerReparaciones() {
    return _totalReparaciones;
  }
}
