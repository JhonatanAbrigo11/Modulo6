import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_de_tareas/models/tarea.dart';
import 'package:gestion_de_tareas/services/DatabaseHelper.dart';
import 'package:gestion_de_tareas/views/EditTaskPage.dart';
import 'package:gestion_de_tareas/widgets/TaskTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Tarea>> _tareaList;
  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _tareaList = Databasehelper().obtenerTareas();
    });
  }

  void _deleteTask(int id) async {
    await Databasehelper().eliminarTarea(id);
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MIS TAREAS')),
      body: FutureBuilder<List<Tarea>>(
        future: _tareaList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('NO HAY TAREAS PARA MOSTRAR'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map(
                    (tarea) => Tasktile(
                      tarea: tarea,
                      onDelete: () => _deleteTask(tarea.id),
                      onEdit: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EdiTaskPage(tarea: tarea),
                          ),
                        );
                        if (result == true) _refreshList();
                      },
                    ),
                  )
                  .toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add');
          if (result == true) _refreshList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
