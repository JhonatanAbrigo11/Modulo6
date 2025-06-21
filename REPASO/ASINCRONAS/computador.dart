Future<String> prenderComputador() {
  return Future.delayed(Duration(seconds: 8), () => 'Compu encendida');
}

void encederComputador() async {
  print('Presiono tecla de encendido');
  final prendido = await prenderComputador();
  print(prendido);
  print('Ingresado a la aula virtual');
}

void main() {
  print('Llegando a prender el computador');
  encederComputador();
  print('Voy a traer el cargador');
  print('Me pongo los lentes');
}
