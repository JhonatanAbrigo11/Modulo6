import 'package:flutter_test/flutter_test.dart';
import 'package:lista_clientes_bd/databaseHelper.dart';
import 'package:lista_clientes_bd/producto.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Inicializa FFI
  sqfliteFfiInit();

  //Cambia la fábrica de las base de datos por la de FFI
  databaseFactory = databaseFactoryFfi;

  late DatabaseHelper databaseHelper;

  setUp(() {
    databaseHelper = DatabaseHelper();
  });

  test('Insert product', () async {
    var product = Product(
      id: 1,
      name: 'Test Producto',
      price: 9.99,
      description: 'Test Description',
      correo: 'Test correo',
    );
    await databaseHelper.insertPorduct(product);

    var products = await databaseHelper.getProducts();
    // Recorrer la lista de productos e imprimir en consola
    for (var product in products) {
      print(
        'ID: ${product.id}, NAME: ${product.name}, Price: ${product.price}, Description: ${product.description} correo: ${product.correo}',
      );
    }
  });
  test('Update Product', () async {
    var product = Product(
      id: 1,
      name: 'Update Product',
      price: 200.99,
      description: 'Update Product',
      correo: 'Update correo',
    );
    await databaseHelper.updateProduct(product);

    var products = await databaseHelper.getProducts();
    // Recorrer la lista de productos e imprimir en consola
    for (var product in products) {
      print(
        'ID: ${product.id}, NAME: ${product.name}, Price: ${product.price}, Description: ${product.description}, correo: ${product.correo}',
      );
    }
  });
  test('Delete Product', () async {
    await databaseHelper.deleteProduct(1);

    var products = await databaseHelper.getProducts();
    // Recorrer la lista de productos e imprimir en consola
    for (var product in products) {
      print(
        'ID: ${product.id}, NAME: ${product.name}, Price: ${product.price}, Description: ${product.description}, correo: ${product.correo}',
      );
    }
  });
}
