import 'package:flutter/material.dart';
import 'package:gestion_de_tareas/models/tarea.dart';
import 'package:gestion_de_tareas/services/DatabaseHelper.dart';

class EdiTaskPage extends StatefulWidget {
  final Tarea tarea;
  const EdiTaskPage({super.key, required this.tarea});

  @override
  State<StatefulWidget> createState() => _EdiTaskPageState();
}

class _EdiTaskPageState extends State<EdiTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tituloController;
  late TextEditingController _descripcionController;
  late TextEditingController _fechaController;
  late String _estado;

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.tarea.titulo);
    _descripcionController = TextEditingController(
      text: widget.tarea.descripcion,
    );
    _fechaController = TextEditingController(
      text: widget.tarea.fechaVencimiento,
    );
    _estado = widget.tarea.estado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDITAR TAREA'),
        elevation: 8.0,
        shadowColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'TITULO'),
                //validar que el texto 'TITUL0' no sea null
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'EL TITULO DEBE SER INGRESADO';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descripcionController,
                // PARA PODER INGRESAR EL TEXTO MAS LARGO
                maxLines: null, //Permite  q crezca el texto,
                decoration: const InputDecoration(labelText: 'DESCRIPCION'),
              ),

              TextFormField(
                controller: _fechaController,
                readOnly: true, // impide escribir directamente
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    String formattedDate = pickedDate
                        .toIso8601String()
                        .split('T')
                        .first;
                    _fechaController.text = formattedDate;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Fecha de vencimiento',
                  hintText: 'YYYY-MM-DD',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una fecha';
                  }
                  // verifica q la fecha sea ingresada correctamente
                  final RegExp formatoFecha = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                  if (!formatoFecha.hasMatch(value)) {
                    return 'Formato incorrecto (YYYY-MM-DD)';
                  }
                  //verifica q la fecha sea real
                  try {
                    DateTime.parse(value);
                  } catch (e) {
                    return 'Fecha inválida';
                  }

                  return null;
                },
              ),
              DropdownButton(
                value: _estado,
                items: ['Completada', 'Pendiente']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => _estado = val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final actualizarTarea = Tarea(
                      id: widget.tarea.id,
                      titulo: _tituloController.text,
                      descripcion: _descripcionController.text,
                      fechaVencimiento: _fechaController.text,
                      estado: _estado,
                    );
                    await Databasehelper().actualizarTarea(actualizarTarea);
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
