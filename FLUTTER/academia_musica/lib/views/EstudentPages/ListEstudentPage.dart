import 'package:academia_musica/components/customAppBar.dart';

import 'package:academia_musica/components/searchBarGeneral.dart';

import 'package:academia_musica/models/student.dart';
import 'package:academia_musica/routes/routes.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:academia_musica/views/EstudentPages/EditStudentPage.dart';
import 'package:academia_musica/widgets/StudenTile.dart';
import 'package:flutter/material.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({super.key});

  @override
  State<StatefulWidget> createState() => ListeStudenTPageState();
}

class ListeStudenTPageState extends State<ListStudentPage> {
  late Future<List<Student>> _studentLis;
  //Para buscar los estudiantes
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode =
      FocusNode(); // 👈 para controlar el teclado

  @override
  void initState() {
    super.initState();
    _refreshList();
    Future.delayed(Duration.zero, () {
      _searchFocusNode.unfocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocusNode.unfocus();
    _searchController.dispose();
    _searchFocusNode.dispose();
  }

  void _refreshList() {
    setState(() {
      _studentLis = Databasehelper().getStudent();
    });
  }

  void _deleteStudent(int id) async {
    await Databasehelper().deleteStudent(id);
    _refreshList();
  }

  // para busar el estudiante
  void _searchStudents(String name) {
    setState(() {
      _studentLis = Databasehelper().searchStudentsByName(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('A.C PRODUCCIONES', 'LISTA DE ESTUDIANTES'),
      body: Column(
        children: [
          SearchBarGeneral(
            nameSearch: 'Buscar estudiante',
            key: ValueKey('Busca estudiante'),
            controller: _searchController,
            focusNode: _searchFocusNode,
            onChanged: (query) {
              if (query.isEmpty) {
                _searchFocusNode.unfocus();
                _refreshList();
              } else {
                _searchStudents(query);
              }
            },
          ),
          //  Lista de estudiantes
          Expanded(
            child: FutureBuilder<List<Student>>(
              future: _studentLis,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'NO HAY ESTUDIANTES PARA MOSTRAR',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final student = snapshot.data![index];
                      return StudenTile(
                        student: student,
                        onDelte: () => _deleteStudent(student.id),
                        onEdit: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditStudentPage(student: student),
                            ),
                          );
                          if (result == true) {
                            _searchController.clear();
                            _refreshList();
                            _searchFocusNode.unfocus();
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, Routes.add);
          if (result == true) _refreshList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
