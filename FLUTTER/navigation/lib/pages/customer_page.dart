import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget{
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Text("PAGINA CLIENTES", style: TextStyle(color: Colors.lightBlue),),

      ),
    );
  }
}