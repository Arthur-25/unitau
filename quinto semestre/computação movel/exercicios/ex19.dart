import 'dart:io';

void main(){

    //primeiro numero

    int numero1;

    print("Digite o primeiro numero");

    numero1 = int.parse(stdin.readLineSync()!);

    if (numero1 > -1){

        print(numero1*2);

    }

    else{

        print(numero1*3);

    }

    //numero 2

    int numero2;

    print("Digite o segundo numero");

    numero2 = int.parse(stdin.readLineSync()!);

    if (numero2 > 10 && numero2 < 100){

        print("Intervalo permitido");

    }

    //numero 3

    int numero3;

    print("Digite terceiro numero");

    numero3 = int.parse(stdin.readLineSync()!);

    if (numero3 < numero2){

        print(numero3 - numero2);

    }

    else{

        print(numero3 + 1);

    }

}