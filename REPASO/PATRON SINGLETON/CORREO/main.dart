import 'servidor_correo.dart';

void main() {
  final correo1 = ServidorCorreo();
  final correo2 = ServidorCorreo();

  correo1.conectar();
  correo1.enviarCoore('Juan', 'Administracion de datos');
  correo1.enviarCoore('Karla', 'Contabilidad');

  correo2.enviarCoore('Javier', 'Documentos de oficina');
  correo2.enviarCoore('Jhonatan', 'Revisar el servidor');

  print(correo1 == correo2);
  print(correo1.estaConectado);
  correo1.desconectar();
}
