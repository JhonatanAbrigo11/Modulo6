import 'package:academia_musica/components/customAppBar.dart';
import 'package:academia_musica/components/searchBarGeneral.dart';
import 'package:academia_musica/models/teacher.dart';
import 'package:academia_musica/routes/routes.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:academia_musica/views/TeacherPages/EditTeacherPage.dart';
import 'package:academia_musica/widgets/TeacherTile.dart';
import 'package:flutter/material.dart';

class ListTeacherPage extends StatefulWidget {
  const ListTeacherPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListTeacherPageState();
}

class _ListTeacherPageState extends State<ListTeacherPage> {
  late Future<List<Teacher>> _teacherList;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _teacherList = Databasehelper().getTeachers();
    });
  }

  void _deleteTeacher(String id) async {
    await Databasehelper().deleteTeacher(id);
    _refreshList();
  }

  void _searchTeacher(String name) {
    setState(() {
      _teacherList = Databasehelper().searchTeachersByName(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('A.C PRODUCCIONES', 'LISTA DE PROFESORES', () {
        _refreshList();
      }),
      body: Column(
        children: [
          SearchBarGeneral(
            nameSearch: 'Buscar profesor',
            key: ValueKey('Busca profesor'),
            controller: _searchController,
            focusNode: _searchFocusNode,
            onChanged: (query) {
              if (query.isEmpty) {
                _searchFocusNode.unfocus();
                _refreshList();
              } else {
                _searchTeacher(query);
              }
            },
          ),
          //  Lista de estudiantes
          Expanded(
            child: FutureBuilder<List<Teacher>>(
              future: _teacherList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'NO HAY PROFESORES PARA MOSTRAR',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final teacher = snapshot.data![index];
                      return TeacherTile(
                        teacher: teacher,
                        onDelte: () => _deleteTeacher(teacher.id),
                        onEdit: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditTeacherPage(teacher: teacher),
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
          final result = await Navigator.pushNamed(context, Routes.addTeacher);
          if (result == true) _refreshList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
