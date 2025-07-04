import 'package:academia_musica/routes/routes.dart';
import 'package:academia_musica/views/EstudentPages/AddStudentPage.dart';
import 'package:academia_musica/views/EstudentPages/ListEstudentPage.dart';
import 'package:academia_musica/views/HomePage.dart';
import 'package:academia_musica/views/TeacherPages/AddTeacherPage.dart';
import 'package:academia_musica/views/TeacherPages/LisTeacherPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        Routes.add: (context) => AddStudentPage(),
        Routes.estudiantes: (context) => ListStudentPage(),
        Routes.addTeacher: (context) => AddTeacherPage(),
        Routes.profesores: (context) => ListTeacherPage(),
      },
    );
  }
}
