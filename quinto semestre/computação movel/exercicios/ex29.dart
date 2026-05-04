import 'dart:io';

void main(){

    print("Digite o valor inicial");

    int VALOR_INICIAL = int.parse(stdin.readLineSync()!);

    print("Digite o valor final");

    int VALOR_FINAL = int.parse(stdin.readLineSync()!);

    int i = VALOR_INICIAL;

    while(i <= VALOR_FINAL){

        if (i % 2 == 0){

            print("$i - par");

        }

        else{

            print("$i - impar");

        }

        i++;

    }

    print("\n ======================================== \n");

    for (i = VALOR_INICIAL; i <= VALOR_FINAL; i++){

        if (i % 2 == 0){

            print("$i - par");

        }

        else{

            print("$i - impar");

        }

    }
}