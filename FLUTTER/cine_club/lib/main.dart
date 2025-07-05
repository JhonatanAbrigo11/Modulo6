import 'package:cine_club/views/AddPeliculaPage.dart';
import 'package:cine_club/views/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CINE CLUB',
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {'/add': (context) => Addtaskpage()},
    );
  }
}
