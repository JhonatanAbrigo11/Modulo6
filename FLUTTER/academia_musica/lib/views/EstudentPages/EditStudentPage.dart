import 'package:academia_musica/components/customAppBar.dart';
import 'package:academia_musica/components/validators.dart';
import 'package:academia_musica/models/student.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:flutter/material.dart';

class EditStudentPage extends StatefulWidget {
  final Student student;
  const EditStudentPage({super.key, required this.student});

  @override
  State<StatefulWidget> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late String _instrument;
  late String _academicLevel;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _lastNameController = TextEditingController(text: widget.student.lastName);
    _instrument = widget.student.instrument;
    _academicLevel = widget.student.academicLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('A.C PRODUCCIONES', 'EDITAR ESTUDIANTE'),
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
                      id: widget.student.id,
                      name: _nameController.text,
                      lastName: _lastNameController.text,
                      instrument: _instrument,
                      academicLevel: _academicLevel,
                    );
                    await Databasehelper().updateStudent(student);
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
