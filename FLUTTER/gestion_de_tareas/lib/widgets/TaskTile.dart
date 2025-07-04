import 'package:flutter/material.dart';
import 'package:gestion_de_tareas/models/tarea.dart';

class Tasktile extends StatelessWidget {
  final Tarea tarea;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const Tasktile({
    super.key,
    required this.tarea,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: ListTile(
        title: Text(tarea.titulo),
        subtitle: Text('${tarea.descripcion} ${tarea.fechaVencimiento}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
