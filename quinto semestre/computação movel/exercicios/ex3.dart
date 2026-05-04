import 'dart:io';

void main(){

    int base;

    int altura;

    print("Digite o valor da base do retangulo");

    base = int.parse(stdin.readLineSync()!);

    print("Digite o valor da altura do retangulo");

    altura = int.parse(stdin.readLineSync()!);

    int areaRetangulo = base*altura;

    print("A area do retangulo de base $base e altura $altura é: $areaRetangulo");
}