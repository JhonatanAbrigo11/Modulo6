import 'package:flutter/material.dart';
import 'package:lista_clientes_bd/databaseHelper.dart';
import 'package:lista_clientes_bd/producto.dart';
import 'package:sqflite/sqflite.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();
    final correoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("INGRESO A PRODUCTOS")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre Producto'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: 'Correo Electronico',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descriptionController.text,
                  correo: correoController.text,
                );
                DatabaseHelper().insertPorduct(product);
                print('Producto ingresado a la base de datos ${product.name}');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto añadido!!!!')),
                );
                Navigator.pop(context, true); //cierra la pantalla
              },
              child: const Text('GRABAR'),
            ),
          ],
        ),
      ),
    );
  }
}
