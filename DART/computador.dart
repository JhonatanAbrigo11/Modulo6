import 'dispositivo_electronico.dart';

class Computador  extends DispositivoElectronico{
  int capacidadDisco;
  Computador(super.codigo,super.marca,this.capacidadDisco);

  @override
  void imprimir(){
    print('CODIGO: $codigo , MARCA: $marca , CAPACIDAD DISCO: $capacidadDisco');
  }
}

void main(){
    final compu = Computador(123, 'LENOVO',128);
    compu.imprimir();
}