import 'taller.dart';

class Empleado {
  String nombre;

  Empleado(this.nombre);

  void actulizarMensaje(String nuevoMensaje) {
    Taller.cambiarMensaje(nuevoMensaje);
  }
}
