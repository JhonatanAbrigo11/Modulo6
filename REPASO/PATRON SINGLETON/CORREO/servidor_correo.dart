class ServidorCorreo {
  static final ServidorCorreo _instacia = ServidorCorreo._interno();

  factory ServidorCorreo() => _instacia;

  ServidorCorreo._interno();

  bool _conectado = false;

  bool get estaConectado => _conectado;

  void conectar() {
    if (!_conectado) {
      _conectado = true;
      print('Conectado con el servidor');
    } else {
      print('No se ha conectado con el servidor');
    }
  }

  void enviarCoore(String destinatario, String asunto) {
    if (_conectado) {
      print('${destinatario} : ${asunto}');
    } else {
      print('No se puede enviar el correo');
    }
  }

  void desconectar() {
    if (_conectado) {
      _conectado = false;
      print('El servidor se ha desconectado');
    } else {
      print('El servidor no esta conectado');
    }
  }
}
