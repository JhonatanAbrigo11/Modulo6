void main() {
  Map<String, int> puntajes = {
    'Juan': 100,
    'Luis': 30,
    'Jose': 20,
    'Denver': 11,
  };

  print(puntajes.keys);
  print(puntajes['Denver']);
  puntajes['Denver'] = 100;
  puntajes['Rio'] = 80;
  puntajes.remove('Juan');

  print(puntajes);
}
