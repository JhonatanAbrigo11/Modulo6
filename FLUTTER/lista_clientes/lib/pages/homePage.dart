import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_clientes/pages/routes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("HOME")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.listCustomer);
            },
            color: Colors.greenAccent,
            child: Text("IR A LA LISTA DE CLIENTES"),
          ),
        ],
      ),
    );
  }
}
