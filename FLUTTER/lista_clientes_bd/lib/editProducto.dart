import 'package:flutter/material.dart';
import 'package:lista_clientes_bd/databaseHelper.dart';
import 'package:lista_clientes_bd/producto.dart';

class Editproduct extends StatefulWidget {
  final Product product;

  const Editproduct({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    return EditProductoState();
  }
}

class EditProductoState extends State<Editproduct> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController correoController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    descriptionController = TextEditingController(
      text: widget.product.description,
    );
    correoController = TextEditingController(text: widget.product.correo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edicion del Producto")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre Producto'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Precio Producto'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripcion'),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: 'Correo Electronico',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updateProduct = Product(
                  id: widget.product.id,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descriptionController.text,
                  correo: correoController.text,
                );
                await DatabaseHelper().updateProduct(updateProduct);
                print('Product updated: ${updateProduct.name}');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto Actualizado')),
                );
                Navigator.pop(context, true);
              },
              child: const Text('GUARDAR'),
            ),
          ],
        ),
      ),
    );
  }
}
