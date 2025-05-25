class Mensaje {
  void saludar(String nombre, String apellido, String apodo){
    print("Hola $nombre, $apellido, alias  $apodo");
  }

  void darBienvenida(String nombre, String apellido, String? apodo){
    print("Hola $nombre, $apellido, alias  $apodo");
  }
}

void maim(){
  final msg = Mensaje();
  msg.saludar("Jaime", "Hola", "");

  msg.darBienvenida("JAIME", "HOLA", null);
  msg.darBienvenida("JAIME", "HOLA", "EL FLACO");
}