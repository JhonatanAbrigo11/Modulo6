// future, asyn - await

void main() {
  //print('Operacion 1');
  //Future.delayed(Duration(seconds: 3), () => print('Operacion 2 asincrona'));
  ///print('Operacion 3');
  //print('Operacion 4');
  print('Esto en mi casa');
  pedirPizza();
  print('Viendo la televixion');
}

Future<String> prepararPizza() {
  return Future.delayed(Duration(seconds: 5), () => 'Pizza entregada');
}

void pedirPizza() async {
  print('Llamando a la pizeria');
  final mensaje = await prepararPizza();
  print(mensaje);

  print('A comer la pizza');
}
