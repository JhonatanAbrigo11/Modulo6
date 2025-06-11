
  import 'package:flutter/material.dart';

  class CalculatorPage  extends StatefulWidget{
    const CalculatorPage({super.key});

    @override
    State<StatefulWidget> createState() {
      return CalculadoraPageState();  }

  }

  class CalculadoraPageState extends State {
    int? valor1;
    int? valor2;
    int resultado=0;
    
    TextEditingController controller1 = TextEditingController(text: "0");
    TextEditingController controller2 = TextEditingController(text: "0");

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("CALCULADORA", style: TextStyle(color: const Color.fromARGB(255, 71, 3, 15))),
          ),
          backgroundColor: Colors.blue,
          shadowColor: const Color.fromARGB(137, 180, 39, 39),
          elevation: 30,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text("Ingrese un valor"),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: controller1,
                onChanged: (txt1){
                valor1= int.tryParse(txt1);
              },),

              Text("Ingrese un valor"),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: controller2,
                onChanged: (txt2){
                valor2= int.tryParse(txt2);
              },),
              MaterialButton(
                color: Colors.green,
                child: Text("SUMAR"),
                onPressed: () {
                  resultado = valor1! + valor2!;
                  setState(() {});
                },
            ),
            Text("Resultado: $resultado"),
            ],
            
          ),
          ),
      )
      ;
  }

}