class Pelicula {
  String titulo;
  int anioEstreno;
  Pelicula(this.titulo, this.anioEstreno);
}

void main() {
  Map<String, List<Pelicula>> ctalogoStreaming = {
    'Netflix': [
      Pelicula('Entre dos tierras', 2023),
      Pelicula('El silencio de la sombra', 2024),
      Pelicula('Amor en Marte', 2022),
    ],
    'HBO': [
      Pelicula('Stich', 2025),
      Pelicula('La última misión', 2023),
      Pelicula('Código Omega', 2024),
    ],
    'Disney+': [
      Pelicula('Entrenando a tu dragon', 2025),
      Pelicula('El reino escondido', 2023),
      Pelicula('Aventura en el tiempo', 2022),
    ],
  };

  ctalogoStreaming['Disney+']?.add(Pelicula('Rio', 2025));

  //Eliminar un objeto de una list en este caso DE LA CLAVE Netflix
  ctalogoStreaming.values.forEach(
    (lista) => lista.removeWhere((p) => p.titulo == 'Entre dos tierras'),
  );

  for (var catalogo in ctalogoStreaming.entries) {
    print('Plataforma ${catalogo.key}');
    for (var pelicula in catalogo.value) {
      print('- ${pelicula.titulo} (${pelicula.anioEstreno})');
    }
  }
}
