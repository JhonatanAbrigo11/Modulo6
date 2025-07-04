import 'package:flutter/material.dart';
import 'package:gestion_de_tareas/views/AddTaskPage.dart';
import 'package:gestion_de_tareas/views/HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea Demo',
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {'/add': (context) => Addtaskpage()},
    );
  }
}
