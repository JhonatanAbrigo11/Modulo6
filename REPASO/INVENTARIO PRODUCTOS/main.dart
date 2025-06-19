import 'Tienda.dart';
import 'producto.dart';

void main() {
  Producto p1 = Producto('P001');
  Producto p2 = Producto('P002');

  p1.registrarVenta('Fritura', 0.25, 'NO CONSUMIR EN EXTREMO');
  p2.registrarVenta('FRUTAS', 1.00, true);

  Tienda.cambiarAnuncio('SOLO POR HOY 2X1');
  p1.resumen();
  p2.resumen();

  print('TOTAL VENTAS ${Tienda.obtenerVentas()}');
}
