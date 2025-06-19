import 'package:flutter/material.dart';
import 'package:navigation/pages/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            onPressed: () {
              //Navigator.push(context, route);
              Navigator.pushNamed(context, Routes.products);
            },
            color: Colors.blue,
            child: Text("IR A PAGINA DE PRODUCTOS"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.customer);
            },
            color: Colors.amber,
            child: Text("IR A CLIENTES"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.listview);
            },
            color: const Color.fromARGB(255, 15, 156, 22),
            child: Text("IR A LISTVIEW"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.productsList);
            },
            color: const Color.fromARGB(255, 164, 214, 24),
            child: Text("IR A LISTA DE PRODUCTOS"),
          ),
        ],
      ),
    );
  }
}
