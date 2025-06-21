import 'dart:ffi';

void main() {
  List<String> ciudades = ['Quito', 'Guayaquil', 'Cuenca', 'Loja', 'Quito'];

  print(ciudades);

  //ciudades.add(10);

  print(ciudades);
  print(ciudades[1]);

  ciudades.remove('Quito');
  print(ciudades);

  List<List<int>> numeros = [
    [1, 2, 3],
    [4, 5, 6],
  ];

  print(numeros[0][1]);

  List<Ciudad> ciudadesObj = [
    Ciudad('QUITO', 20000),
    Ciudad('CUENCA', 10000),
    Ciudad('AMBATO', 85000),
  ];

  print(ciudadesObj[0].nombre);
  print(ciudadesObj[1].poblacion);

  ciudadesObj.add(Ciudad('Loja', 10000));

  for (var ciudad in ciudadesObj) {
    print('${ciudad.nombre}, ${ciudad.poblacion}');
  }
}

class Ciudad {
  String? nombre;
  int? poblacion;
  Ciudad(this.nombre, this.poblacion);
}
