
class Probar {
  void test({String param1="defecto",String? param2}){
     print("$param1 $param2");
  }
}

void main(){
  final p1 = Probar();
  p1.test(param2: "perez",param1: "juan");
}