import 'dart:io';

void main(){

    print("Digite o numero inicial");

    int valor_inicial = int.parse(stdin.readLineSync()!);

    print("Digite o numero final");

    int valor_final = int.parse(stdin.readLineSync()!);

    if (valor_inicial > valor_final){

        print("Valor inicial maior que final");

    }

    else{

        for (int i = valor_inicial; i <= valor_final; i++){

            print(i);

        }

    }

}