import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.house),
          onPressed: ()=>{
          print('Hola')
        },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer:const Drawer(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text("Opcion 1"),
              Text("Opcion 2"),
              Text("Opcion 3")  

            ],
          ),
        ),
        body: const Center(
          child: Text('Widgets!'),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 111, 221, 97),
          title:  const Center(
            child: Text ("HOLA MUNDO APP")
            ),
          titleTextStyle: const TextStyle(
            fontSize: 15,
            color: Colors.red

          ),

        ),
        backgroundColor: Color.fromARGB(255, 16, 173, 23),
      ),
    );
  }
}
