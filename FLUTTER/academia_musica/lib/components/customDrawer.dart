import 'package:academia_musica/routes/routes.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Drawer CustomDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 142, 212, 245),
    child: ListView(
      padding: EdgeInsets
          .zero, // Importante para que el contenido no se solape con la barra de estado
      children: <Widget>[
        // Puedes agregar un encabezado al Drawer
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
            child: Text(
              'Menú Principal',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),

        // Los elementos de la lista del menú
        ListTile(
          leading: const Icon(Icons.piano),
          title: const Text('ESTUDIANTES'),
          onTap: () async {
            Navigator.pop(context); // Cierra el Drawer
            await Navigator.pushNamed(context, Routes.estudiantes);
          },
        ),
        ListTile(
          leading: const Icon(Icons.music_note),
          title: const Text('PROFESORES'),
          onTap: () async {
            Navigator.pop(context);
            await Navigator.pushNamed(
              context,
              Routes.profesores,
            ); // Cierra el Drawer
          },
        ),
        ListTile(
          leading: const Icon(Icons.music_note),
          title: const Text('AULA DE BATERIA'),
          onTap: () {
            // Lógica cuando se toca "Acerca de"
            //Navigator.pop(context); // Cierra el Drawer
          },
        ),
      ],
    ),
  );
}
