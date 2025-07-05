import 'package:academia_musica/components/customAppBar.dart';
import 'package:academia_musica/components/validators.dart';
import 'package:academia_musica/models/teacher.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTeacherPage extends StatefulWidget {
  const AddTeacherPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddTeacherPageState();
}

class _AddTeacherPageState extends State<AddTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lasNameController = TextEditingController();
  String _specialty = 'GUITARRA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('A.C PRODUCCIONES', 'Añadir Profesor'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: Validators.validateString,
              ),
              TextFormField(
                controller: _lasNameController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              Text('Especialidad: ', style: TextStyle(fontSize: 15)),
              DropdownButton(
                value: _specialty,
                items: ['PIANO', 'GUITARRA', 'BATERIA', 'CANTO']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => _specialty = val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final teacher = Teacher(
                      id: '',
                      name: _nameController.text,
                      lasName: _lasNameController.text,
                      specialty: _specialty,
                    );
                    await Databasehelper().insertTeacher(teacher);
                    Navigator.pop(context, true);
                  }
                },
                child: const Text('GUARDAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
