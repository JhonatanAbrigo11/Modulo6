import 'package:flutter/material.dart';
import 'package:lista_clientes/pages/homePage.dart';
import 'package:lista_clientes/pages/list_customers.dart';
import 'package:lista_clientes/pages/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      routes: {
        Routes.listCustomer: (context) {
          return ListCustomers();
        },
      },
    );
  }
}
