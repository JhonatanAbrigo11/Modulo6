import 'Tienda.dart';

class Producto {
  String codigo;
  late String descripcion = '';
  double precio = 0.0;
  var observacion;

  Producto(this.codigo);

  void registrarVenta(String descripcion, double precio, var observacion1) {
    descripcion = descripcion;
    precio = precio;
    observacion = observacion1;
    Tienda.aumentarVentas();
  }

  void resumen() {
    print(
      'CODIGO PRODUCTO: ${codigo}, DESCRIPCION: ${descripcion}, PRECIO: ${precio}, OBSERVACION: ${observacion}, TIENDA: ${Tienda.nombre}, ANUNCIO: ${Tienda.anuncio}',
    );
  }
}
