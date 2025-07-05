import 'dart:async';

import 'package:cine_club/models/pelicula.dart';
import 'package:cine_club/services/DatabaseHelper.dart';
import 'package:cine_club/views/EditPeliculaPage.dart';
import 'package:cine_club/widgets/PeliculaTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Pelicula>> _peliculaList;
  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _peliculaList = Databasehelper().obtenerPeliculas();
    });
  }

  void _deleteTask(int id) async {
    await Databasehelper().eliminarPelicula(id);
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MIS PELICULAS')),
      body: FutureBuilder<List<Pelicula>>(
        future: _peliculaList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('NO HAY PELICULAS PARA MOSTRAR'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map(
                    (pelicula) => Peliculatile(
                      pelicula: pelicula,
                      onDelete: () => _deleteTask(pelicula.id),
                      onEdit: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EdiTaskPage(pelicula: pelicula),
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
