class Persona {
  String? nombre;
  int edad=0;
  double? estatura;

  Persona(String nombre, int edad, double estatura){
    this.nombre= nombre;
    this.edad = edad;
    this.estatura= estatura;
  }
}

void main(){
  Persona p = Persona("Juanito",30,1.70);
  print("Nombre: ${p.nombre} ");
  print("EDAD : ${p.edad}");
  print('Estatura: ${p.estatura}');
}

