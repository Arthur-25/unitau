import 'dart:io';

void main(){

    int base;

    int altura;

    print("Digite o valor da base do triangulo");

    base = int.parse(stdin.readLineSync()!);

    print("Digite o valor da altura do triangulo");

    altura = int.parse(stdin.readLineSync()!);

    double areaTriangulo = (base*altura)/2;

    print("Area do triangulo de base $base e altura $altura é: $areaTriangulo");
}