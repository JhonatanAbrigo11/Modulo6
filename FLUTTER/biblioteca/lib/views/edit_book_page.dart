import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:flutter/material.dart';

class EditBookPage extends StatefulWidget {
  final Book book;
  const EditBookPage({super.key, required this.book});

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController noteController;
  late String status;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.book.title);
    authorController = TextEditingController(text: widget.book.author);
    noteController = TextEditingController(text: widget.book.note);
    status = widget.book.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EDITAR LIBRO')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
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
                final updateBook = Book(
                  id: widget.book.id,
                  title: titleController.text,
                  author: authorController.text,
                  status: status,
                  note: noteController.text,
                );
                await DatabaseHelper().insertBook(updateBook);
                Navigator.pop(context, true);
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
