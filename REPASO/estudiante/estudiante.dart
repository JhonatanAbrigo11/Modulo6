class Estudiante {
  final String nombre;
  late String cuaderno;
  static String pizarra = 'Limpia';
  static const escuela = '14 de julio';
  static int _contadorEstudiantes = 0;

  void escribirPizarra(String mensaje) {
    pizarra = mensaje;
  }

  static obtenerContador() {
    return _contadorEstudiantes++;
  }

  Estudiante(this.nombre);
}
