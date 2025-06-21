void main() {
  Map<String, int> poblacion = {
    'QUITO': 20000,
    'CUENCA': 10000,
    'AMBATO': 85000,
  };

  print(poblacion);

  print(poblacion.keys);
  print(poblacion.values);

  print(poblacion.containsKey('esmeraldas'));
  print(poblacion['CUENCA']);
  poblacion['Loja'] = 40000;

  print(poblacion);
  poblacion['CUENCA'] = 100;
  print(poblacion);

  poblacion.remove('CUENCA');
  print(poblacion);

  Map<String, List<String>> regiones = {
    'Costa': ['Guayaquil', 'Manta'],
    'Sierra': ['Quito', 'Cuenca'],
    'Oriente': ['Tena', 'Puyo'],
  };
  print(regiones['Sierra']);
  print(regiones['Sierra']![1]);
}
