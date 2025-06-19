import 'taller.dart';

class Vehiculo {
  String placa;
  String estado = 'Pendiente';
  var extraInfo;
  late String diagnostico;

  Vehiculo(this.placa);

  void registrarDiagnostico(String mensaje) {
    diagnostico = mensaje;
    estado = 'Reparado';
  }

  void resumen() {
    print(
      'PLACA: ${placa}, ESTADO: ${estado}, DIAGNOSTICO: ${diagnostico} INFORMACION: ${extraInfo} MENSAJE: ${Taller.mensajeBienvenida} TALLER NOMBRE: ${Taller.nombre}',
    );
  }
}
