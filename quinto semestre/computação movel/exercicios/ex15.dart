import 'dart:io';

void main(){

    int numero;

    print("Digite um numero");

    numero = int.parse(stdin.readLineSync()!);

    if (numero > 0){

        print("O numero $numero é positivo");

    }

    else if (numero == 0){

        print("O numero $numero é 0");

    }

    else{

        print("O numero $numero é negativo");

    }

}