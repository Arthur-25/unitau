import 'dart:io';

void main(){

    int lado;

    print("Digite o valor do lado do quadrado");

    lado = int.parse(stdin.readLineSync()!);

    int areaQuadrado = lado*lado;

    print("A area do quadrado de lado $lado é: $areaQuadrado");
    
}