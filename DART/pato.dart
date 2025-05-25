import 'animal.dart';

class Pato extends Animal {

    @override
    void dormir(){
        print('PATO DURIMIENDO');
    }
}

void main(){
  final pato = Pato();
  pato.dormir();
}