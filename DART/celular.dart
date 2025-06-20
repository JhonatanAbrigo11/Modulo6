import 'dispositivo_electronico.dart';

class Celular extends DispositivoElectronico {
  Celular(super.codigo,super.marca);

  @override
  void imprimir(){
    print('CODIGO: $codigo MARCA: $marca');
  }

  @override
  void registrarInventario(){
    print('REGISTRANDO INVENTARIO CODIGO: $codigo MARCA: $marca');
  }
}

void main(){
  final celular= Celular(11,"SAMSUNG");
  celular.imprimir();

  final inventario= Celular(123, "INFINIX");
  inventario.registrarInventario();
}

