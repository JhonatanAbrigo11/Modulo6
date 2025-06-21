void main() {
  print('Voy a enviar un mensaje');
  enviarMensaje();
  print('Ver tiktok');
}

Future<String> recibirMensaje() {
  return Future.delayed(
    Duration(seconds: 3),
    () => 'LLega el mensaje de messenger',
  );
}

void enviarMensaje() async {
  print('Envio un mensaje a messenger');
  final mensaje = await recibirMensaje();
  print(mensaje);
  print('RESPONDIENDO MENSAJE');
}
