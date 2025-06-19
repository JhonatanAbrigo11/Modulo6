import 'package:flutter/material.dart';
import 'package:navigation/pages/customer_page.dart';
import 'package:navigation/pages/home_page.dart';
import 'package:navigation/pages/listview_pages.dart';
import 'package:navigation/pages/product_list_pages.dart';
import 'package:navigation/pages/products_page.dart';
import 'package:navigation/pages/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  get contex => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        Routes.products: (context) {
          return const ProductsPage();
        },
        Routes.customer: (context) {
          return const CustomerPage();
        },
        Routes.listview: (context) {
          return const ListviewPages();
        },
        Routes.productsList: (context) {
          return ProductListPages();
        },
      },
    );
  }
}
