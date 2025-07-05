class Pelicula {
  final int id;
  final String titulo;
  final int anioEstreno;
  final bool vista;
  final String fechaCompra;
  final String resumen;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.anioEstreno,
    required this.vista,
    required this.fechaCompra,
    required this.resumen,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'anioEstreno': anioEstreno,
      'vista': vista,
      'fechaCompra': fechaCompra,
      'resumen': resumen,
    };
  }

  factory Pelicula.fromMap(Map<String, dynamic> map) {
    return Pelicula(
      id: map['id'],
      titulo: map['titulo'],
      anioEstreno: map['anioEstreno'] is int
          ? map['anioEstreno']
          : int.tryParse(map['anioEstreno'].toString()) ?? 0,
      vista:
          map['vista'] == 1 ||
          map['vista'] == true ||
          map['vista'].toString() == 'true',
      fechaCompra: map['fechaCompra'],
      resumen: map['resumen'],
    );
  }
}
