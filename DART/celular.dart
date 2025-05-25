import 'dispositivo_electronico.dart';

class Celular extends DispositivoElectronico {
  @override
  void imprimir(){
    print('CELULAR SIN INFO');
  }
}

void main(){
  final celular= Celular();
  celular.imprimir();
}

