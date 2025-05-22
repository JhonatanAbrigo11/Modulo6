class Persona {
  String? nombre;
  int edad=0;
  double? estatura;

}

void main(){
  Persona p = Persona();
  p.nombre="MARIO";
  p.edad = 50;
  p.estatura = 1.60; 
  print("Nombre: ${p.nombre} ");
  print("EDAD : ${p.edad}");
  print('Estatura: ${p.estatura}');
}