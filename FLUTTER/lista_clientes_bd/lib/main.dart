import 'package:flutter/material.dart';
import 'package:lista_clientes_bd/databaseHelper.dart';
import 'package:lista_clientes_bd/product_List.dart';
import 'package:lista_clientes_bd/product_form.dart';

void main() {
  var dbHelper1 = DatabaseHelper();
  var dbHelper2 = DatabaseHelper();

  if (dbHelper1 == dbHelper2) {
    print('DatabaseHelper es un Singleton');
  } else {
    print('DatabaseHelper no es un Singleton');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProductList(),
      routes: {
        '/add': (context) {
          return const ProductForm();
        },
      },
    );
  }
}
