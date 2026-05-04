import 'dart:io';

void main(){

    int numero1;

    print("Digite o primeiro numero");

    numero1 = int.parse(stdin.readLineSync()!);

    int numero2;

    print("Digite o segundo numero");

    numero2 = int.parse(stdin.readLineSync()!);

    if (numero1 == numero2){

        print("numeros iguais");

    }

    else{

        if (numero1 > numero2){

            print("$numero1 é o maior");

        }

        else{

            print("$numero2 é o maior");

        }

    }

}