import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }

}

class WelcomePageState extends State{
  String? nombre;
  String? apellido;
  String saludo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.red,

      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        child:Column(
          children: [
            const  Text("Ingrese su nombre: "),
            TextField(onChanged: (text){
              nombre = text;
            },),
            const Text("Ingrese su apellido"),
            TextField(onChanged:(text){
              apellido = text;
            },),
            MaterialButton(
              color: Colors.red,
              onPressed:(){
                saludo = "Bienvenido ${nombre!} ${apellido!}";
                setState(() {});
              },
              child: const Text(
                  "SALUDAR",
                  style: TextStyle(backgroundColor: Colors.red),
                  
              ),
            ),
            Text(saludo),
          ],
        ), 
    )
      
    );
  }

}