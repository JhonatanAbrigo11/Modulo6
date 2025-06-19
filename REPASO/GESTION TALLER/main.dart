import 'empleado.dart';
import 'taller.dart';
import 'vehiculo.dart';

void main() {
  Empleado empleado1 = Empleado('Carlos');
  empleado1.actulizarMensaje('HOLA SOY CARLOS');
  Vehiculo v1 = Vehiculo('AA01');
  Vehiculo v2 = Vehiculo('AA02');
  v1.registrarDiagnostico('REPARAR FRENO');
  v2.registrarDiagnostico('REPARAR ACELERADOR');
  v1.extraInfo = 'Buen Taller';
  v2.extraInfo = 10;

  v1.resumen();
  Taller.incrementarContador();
  v2.resumen();
  Taller.incrementarContador();

  print('VEHICULOS REPARADOS : ${Taller.obtenerReparaciones()}');
}
