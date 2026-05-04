import 'dart:io';

void main(){

    int numero;

    print("Digite um numero");

    numero = int.parse(stdin.readLineSync()!);

    if (numero > -1){

        print("O numero $numero é positivo");

    }

    else{

        print("O numero $numero é negativo");

    }

}