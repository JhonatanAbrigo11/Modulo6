import 'package:academia_musica/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudenTile extends StatelessWidget {
  final Student student;
  final VoidCallback onDelte;
  final VoidCallback onEdit;

  const StudenTile({
    super.key,
    required this.student,
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
          '${student.name} ${student.lastName}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instrumento: ${student.instrument}',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Nivel: ${student.academicLevel}',
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
