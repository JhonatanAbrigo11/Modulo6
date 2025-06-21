void main() {
  List<String> comidasFavoritas = [
    'Tilapia',
    'Cuy con papas',
    'Encebollado',
    'Salchipapa',
    'Empanadas',
  ];
  comidasFavoritas.add('Emborrajado');
  comidasFavoritas.remove('Salchipapa');
  print(comidasFavoritas[2]);

  List<List<String>> menuMensual = [
    ['Continental', 'Arroz con pollo', 'Café con pan'],
    ['Americano', 'Lentejas con carne', 'Jugo de frutas'],
    ['Tropical', 'Seco de pollo', 'Té con galletas'],
    ['Ecuatoriano', 'Arroz con menestra y carne', 'Colada morada'],
    ['Ligero', 'Ensalada de atún', 'Yogur con granola'],
    ['Clásico', 'Fritada con mote', 'Batido de banano'],
    ['Andino', 'Arroz con estofado', 'Avena con leche'],
  ];
  print(menuMensual[1][1]);

  menuMensual[4][2] = 'Te';

  for (var menu in menuMensual) {
    print('${menu[0]}, ${menu[1]}, ${menu[2]} ');
  }
}
