import 'dart:io';

void main(){

    int numero;

    print("Digite um numero");

    numero = int.parse(stdin.readLineSync()!);

    if (numero % 2 == 0){

        print("Numero $numero é par");

    }

    else{

        print("Numero $numero é impar");

    }

    if (numero > -1){

        print("Numero $numero é positivo");

    }

    else{

        print("Numero $numero é negativo");

    }

}