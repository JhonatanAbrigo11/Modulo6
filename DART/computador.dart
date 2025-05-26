import 'dispositivo_electronico.dart';

class Computador  extends DispositivoElectronico{
  int capacidadDisco;
  Computador(super.codigo,super.marca,this.capacidadDisco);

  @override
  void imprimir(){
    print('CODIGO: $codigo , MARCA: $marca , CAPACIDAD DISCO: $capacidadDisco');
  }

  @override
  void registrarInventario(){
    print('REGISTRANDO INVENTARIO, CODIGO: $codigo MARCA: $marca CAPACIDAD DISCO: $capacidadDisco');
  }
}

void main(){
    final compu = Computador(123, 'LENOVO',128);
    compu.imprimir();

    final inventario = Computador(12, "HP", 128);
    inventario.registrarInventario();
}