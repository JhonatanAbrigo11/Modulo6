import 'package:academia_musica/components/customAppBar.dart';
import 'package:academia_musica/components/validators.dart';
import 'package:academia_musica/models/teacher.dart';
import 'package:academia_musica/services/DataBaseHelper.dart';
import 'package:flutter/material.dart';

class EditTeacherPage extends StatefulWidget {
  final Teacher teacher;

  const EditTeacherPage({super.key, required this.teacher});

  @override
  State<StatefulWidget> createState() => _EditTeacherPageState();
}

class _EditTeacherPageState extends State<EditTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late String _specialty;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.teacher.name);
    _lastNameController = TextEditingController(text: widget.teacher.lasName);
    _specialty = widget.teacher.specialty;
  }

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
                controller: _lastNameController,
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
                      id: widget.teacher.id,
                      name: _nameController.text,
                      lasName: _lastNameController.text,
                      specialty: _specialty,
                    );
                    await Databasehelper().updateTeacher(teacher);
                    Navigator.pop(context, true);
                  }
                },
                child: const Text('ACTUALIZAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
