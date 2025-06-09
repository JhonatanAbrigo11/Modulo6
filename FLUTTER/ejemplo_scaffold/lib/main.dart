import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home_repair_service), label:"HOLA"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit_rounded), label:"Pasar"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.access_time_rounded),
          onPressed: ()=>{
          print('test')
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Icon(Icons.account_circle_rounded, 
                  color: Colors.blue,),
                  Text("CANDIDATOS",
                  style: TextStyle(color: Colors.blue),)
                 ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.align_horizontal_left,
                    color: Colors.amber,
                  ),
                  Text(
                    "ESTADISTICAS",
                    style:TextStyle(color:Colors.amber),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bluetooth_audio,
                    color: Colors.deepOrange,
                  ),
                  Text(
                    "BlUETOOTH",
                    style: TextStyle(color: Colors.deepOrange)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book_online,
                    color: Colors.green,
                  ),
                  Text(
                    "LIBRO",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey,
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 223, 29, 62),
          elevation: 25,
          centerTitle: true,
          title:const Text ( 
             "APP TEST",
            ),
          titleTextStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            
          ),
        ),
        body: Center(
          child: Text('EJEMPLO!'),
        ),
      ),
    );
  }
}
