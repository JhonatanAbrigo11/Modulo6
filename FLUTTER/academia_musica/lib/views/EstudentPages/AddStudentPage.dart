import 'package:academia_musica/components/customAppBar.dart';
import 'package:academia_musica/components/validators.dart';
import 'package:academia_musica/models/student.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String _instrument = 'PIANO';
  String _academicLevel = 'I';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('A.C PRODUCCIONES', 'AÑADIR ESTUDIANTE'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'NOMBRE'),
                validator: Validators.validateString,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'APELLIDO'),
                validator: Validators.validateString,
              ),
              const SizedBox(height: 7),
              Text('INSTRUMENTO: ', style: TextStyle(fontSize: 15)),
              DropdownButton(
                value: _instrument,
                items: ['PIANO', 'BATERIA', 'GUITARRA', 'CANTO']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => _instrument = val!),
              ),
              Text('NIVEL ACADEMICO: ', style: TextStyle(fontSize: 15)),
              DropdownButton(
                value: _academicLevel,
                items:
                    [
                          'I',
                          'II',
                          'III',
                          'IV',
                          'V',
                          'VI',
                          'VII',
                          'VIII',
                          'IX',
                          'X',
                        ]
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                onChanged: (val) => setState(() => _academicLevel = val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final student = Student(
                      id: '',
                      name: _nameController.text,
                      lastName: _lastNameController.text,
                      instrument: _instrument,
                      academicLevel: _academicLevel,
                    );
                    await Databasehelper().insertStudent(student);
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
