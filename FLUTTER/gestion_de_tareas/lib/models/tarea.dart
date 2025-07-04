class Tarea {
  final int id;
  final String titulo;
  final String descripcion;
  final String fechaVencimiento;
  final String estado;

  Tarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fechaVencimiento,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'fechaVencimiento': fechaVencimiento,
      'estado': estado,
    };
  }
}
