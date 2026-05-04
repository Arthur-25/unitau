import 'dart:io';

void main(){

    print("Digite o valor inicial");

    int valor_inicial = int.parse(stdin.readLineSync()!);

    print("Digite o valor final");

    int valor_final = int.parse(stdin.readLineSync()!);

    for (int i = valor_inicial; i <= valor_final; i++){

        bool primo = true;

        int divisiveis = 0;

        for (int j = 1; j <= i; j++){

            if (i % j == 0){

                divisiveis++;

            }

            if (divisiveis > 2){

                primo = false;

                break;
            }

        }

        if (primo){

            print("O numero $i é primo");

        }

    }

}