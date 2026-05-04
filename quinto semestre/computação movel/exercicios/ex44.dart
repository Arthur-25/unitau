import 'dart:io';

void main(){

    print("Digite o numero inicial");

    int valor_inicial = int.parse(stdin.readLineSync()!);

    print("Digite o numero final");

    int valor_final = int.parse(stdin.readLineSync()!);

    int pares = 0;

    int impares = 0;

    for (int i = valor_inicial; i <= valor_final; i++){

        if (i % 2 == 0){

            pares++;

        }

        else{

            impares++;

        }

    }

    print("Numeros pares: $pares");

    print("Numeros impares: $impares");

}