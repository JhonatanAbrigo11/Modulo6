class ImpresoraCentral {
  static final ImpresoraCentral _instacia = ImpresoraCentral._interno();
  factory ImpresoraCentral() => _instacia;
  ImpresoraCentral._interno();
  bool _conectada = false;
  bool get estaConectada => _conectada;

  void conectar() {
    if (!_conectada) {
      _conectada = true;
      print('Impresora conectada correctamente');
    } else {
      print('Ya existe una conexion activa');
    }
  }

  void imprimir(String archivo) {
    if (_conectada) {
      print('Imprimiendo archivo: ${archivo}');
    } else {
      print('La impresora no esta conectada');
    }
  }
}
