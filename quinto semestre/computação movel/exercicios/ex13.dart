import 'dart:io';

void main(){

    int numero;

    print("informe um numero");

    numero = int.parse(stdin.readLineSync()!);

    if (numero == 0){

        print("O numero $numero é 0");

    }

}