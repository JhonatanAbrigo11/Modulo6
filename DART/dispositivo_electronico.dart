abstract class DispositivoElectronico {
  int codigo;
  String marca;


  DispositivoElectronico(this.codigo,this.marca);


  void imprimir(){
    print('CODIGO: $codigo , MARCA: $marca');
  }

  void registrarInventario();
}