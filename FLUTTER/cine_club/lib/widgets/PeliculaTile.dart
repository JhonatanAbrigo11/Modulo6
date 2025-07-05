import 'package:cine_club/models/pelicula.dart';
import 'package:flutter/material.dart';

class Peliculatile extends StatelessWidget {
  final Pelicula pelicula;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const Peliculatile({
    super.key,
    required this.pelicula,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: const Color.fromARGB(255, 245, 222, 188),
      child: ListTile(
        title: Text(pelicula.titulo),
        subtitle: Text('${pelicula.anioEstreno}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
            Icon(
              pelicula.vista ? Icons.check_circle : Icons.check_circle_outline,
              color: pelicula.vista ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
