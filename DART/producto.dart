class Producto {
  String codigo = "";
  String nombre = "";
  String? descripcion;
  bool activo = true;
  double precio = 0.0;
  int? stock;
}

void main(){
  Producto p1 = new Producto();
  p1.codigo = 'P001';
  p1.nombre = 'Rizadas';
  p1.descripcion = 'Frituras';
  p1.activo = false;
  p1.precio= 0.25;
  p1.stock  = 50;

  print("******* PRODUCTO 1 *****");
  print('CODIGO: ${p1.codigo}');
  print('NOMBRE: ${p1.nombre}');
  print('DESCRIPCION: ${p1.descripcion}');
  print('ACTIVO: ${p1.activo}');
  print('PRECIO: ${p1.precio}');
  print('STOCK: ${p1.stock}');

  var p2 = Producto();
  p2.codigo = 'P002';
  p2.nombre = 'Quesito';
  p2.activo = true;
  p2.precio= 1.50;

  print("******* PRODUCTO 2 *****");
  print('CODIGO: ${p2.codigo}');
  print('NOMBRE: ${p2.nombre}');
  print('ACTIVO: ${p2.activo}');
  print('PRECIO: ${p2.precio}');
 
  final p3 = Producto();
  p3.codigo = 'P003';
  p3.nombre = 'Carne';
  p3.activo = false;
  p3.precio= 2.50;

  print("******* PRODUCTO 3 *****");
  print('CODIGO: ${p3.codigo}');
  print('NOMBRE: ${p3.nombre}');
  print('ACTIVO: ${p3.activo}');
  print('PRECIO: ${p3.precio}');


}