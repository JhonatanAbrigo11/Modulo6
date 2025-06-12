import 'package:flutter/material.dart';
import 'package:navigation/pages/customer_page.dart';
import 'package:navigation/pages/products_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
          onPressed: (){
            //Navigator.push(context, route);
             Navigator.pushNamed(context, "/products");
          },
          color: Colors.blue,
          child: Text("IR A PAGINA DE PRODUCTOS"),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, "/customer");
            },
            color: Colors.amber,
            child: Text("IR A CLIENTES"),)

        ],

        
      ),
    );
  }



}