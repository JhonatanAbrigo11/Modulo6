import 'package:flutter/material.dart';
import 'package:navigation/pages/product_pages.dart';

class ProductListPages extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Producto 1",
      process: 10.0,
      description: "Descripción del produto1",
    ),
    Product(
      name: "Producto 2",
      process: 20.0,
      description: "Descripción del produto2",
    ),
    Product(
      name: "Producto 3",
      process: 30.0,
      description: "Descripción del produto3",
    ),
    Product(
      name: "Producto 4",
      process: 40.0,
      description: "Descripción del produto4",
    ),
    Product(
      name: "Producto 5",
      process: 50.0,
      description: "Descripción del produto5",
    ),
  ];
  ProductListPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
            trailing: Text("\$${products[index].process.toStringAsFixed(2)}"),
          );
        },
      ),
    );
  }
}
