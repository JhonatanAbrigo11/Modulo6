import 'estudiante.dart';

void main() {
  final estudiante1 = Estudiante('Juan');
  final estudiante2 = Estudiante('Ana');
  estudiante1.cuaderno = 'Matematicas';
  estudiante2.cuaderno = 'Historia';

  print(estudiante1.nombre);
  print(estudiante1.cuaderno);
  print(estudiante2.nombre);
  print(estudiante2.cuaderno);

  print(Estudiante.pizarra);
  estudiante1.escribirPizarra('Hola desde Juan');
  print(Estudiante.pizarra);

  print(Estudiante.obtenerContador());
}
