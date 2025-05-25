class Libro{
  String ISBN;
  String titulo;
  int? Npaginas;
  String? descripcion;

  Libro(this.ISBN,this.titulo,this.Npaginas,this.descripcion){}
}

void main(){
  final libro = Libro("1111111", "HOLA", 4, "Ninguna");
  print('Libro ${libro.ISBN}, ${libro.titulo},${libro.Npaginas},${libro.descripcion}');

  final libro1= Libro("222222", "250",null ,null );
  print('Libro ${libro1.ISBN}, ${libro1.titulo},${libro1.Npaginas},${libro1.descripcion}');
}