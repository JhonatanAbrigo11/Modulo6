import 'package:academia_musica/models/teacher.dart';
import 'package:flutter/material.dart';

class TeacherTile extends StatelessWidget {
  final Teacher teacher;
  final VoidCallback onDelte;
  final VoidCallback onEdit;

  const TeacherTile({
    super.key,
    required this.teacher,
    required this.onDelte,
    required this.onEdit,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: Colors.lightBlue,
      child: ListTile(
        leading: Icon(Icons.person, size: 30, color: Colors.black),
        title: Text(
          '${teacher.name} ${teacher.lasName}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ESPECIALIDAD: ${teacher.specialty}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelte, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
