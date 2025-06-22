import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final noteController = TextEditingController();
  String status = 'Pediente';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agegar Libro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ),
            DropdownButton<String>(
              value: status,
              items: [
                'Leido',
                'Pendiente',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => setState(() => status = val!),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Nota'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final book = Book(
                  id: DateTime.now().microsecondsSinceEpoch,
                  title: titleController.text,
                  author: authorController.text,
                  status: status,
                  note: noteController.text,
                );
                await DatabaseHelper().insertBook(book);
                Navigator.pop(context, true);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
