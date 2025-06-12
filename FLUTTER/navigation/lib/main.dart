import 'package:flutter/material.dart';
import 'package:navigation/pages/customer_page.dart';
import 'package:navigation/pages/home_page.dart';
import 'package:navigation/pages/products_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomePage(),
      routes: {
        "/products": (context){
          return const ProductsPage();
        },
        "/customer":(context){
          return const CustomerPage();
        }
      
      },
    );
  }
}
