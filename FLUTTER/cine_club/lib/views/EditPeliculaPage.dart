import 'package:cine_club/models/pelicula.dart';
import 'package:cine_club/services/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class EdiTaskPage extends StatefulWidget {
  final Pelicula pelicula;
  const EdiTaskPage({super.key, required this.pelicula});

  @override
  State<StatefulWidget> createState() => _EdiTaskPageState();
}

class _EdiTaskPageState extends State<EdiTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tituloController;
  late TextEditingController _anioEstrenoController;
  late TextEditingController _vistaController;
  late TextEditingController _fechaCompraController;
  late TextEditingController _resumenController;

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.pelicula.titulo);
    _anioEstrenoController = TextEditingController(
      text: widget.pelicula.anioEstreno.toString(),
    );
    _vistaController = TextEditingController(
      text: widget.pelicula.vista.toString(),
    );
    _fechaCompraController = TextEditingController(
      text: widget.pelicula.fechaCompra,
    );
    _resumenController = TextEditingController(text: widget.pelicula.resumen);
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
                controller: _anioEstrenoController,
                // PARA PODER INGRESAR EL TEXTO MAS LARGO
                maxLines: null, //Permite  q crezca el texto,
                decoration: const InputDecoration(labelText: 'AÑO DE ESTRENO'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _vistaController,
                decoration: const InputDecoration(
                  labelText: '¿VISTA? (true/false)',
                  hintText: 'Escribe true o false',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese si fue vista o no';
                  }

                  final lower = value.toLowerCase();
                  if (lower != 'true' && lower != 'false') {
                    return 'Debe ser "true" o "false"';
                  }

                  return null;
                },
              ),

              TextFormField(
                controller: _fechaCompraController,
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
                    _fechaCompraController.text = formattedDate;
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final actualizarTarea = Pelicula(
                      id: widget.pelicula.id,
                      titulo: _tituloController.text,
                      anioEstreno:
                          int.tryParse(_anioEstrenoController.text) ?? 0,
                      vista: _vistaController.text.toLowerCase() == 'true',
                      fechaCompra: _fechaCompraController.text,
                      resumen: _resumenController.text,
                    );
                    await Databasehelper().actualizarPelicula(actualizarTarea);
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
