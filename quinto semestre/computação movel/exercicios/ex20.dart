import 'dart:io';

void main(){

    int nota1, nota2, nota3, nota4;

    print("Digite suas 4 notas");

    nota1 = int.parse(stdin.readLineSync()!);

    nota2 = int.parse(stdin.readLineSync()!);

    nota3 = int.parse(stdin.readLineSync()!);

    nota4 = int.parse(stdin.readLineSync()!);

    double media = (nota1 + nota2 + nota3 + nota4)/4;

    bool valido = true;

    //Ex 20.1)
    
    if (nota1 < 0 || nota1 > 10){

        valido = false;

    }

    if (nota2 < 0 || nota2 > 10){

        valido = false;

    }

    if (nota3 < 0 || nota3 > 10){

        valido = false;

    }

    if (nota4 < 0 || nota4 > 10){

        valido = false;

    }

    //fim do ex 20.1)

    if (valido){

        if (media >= 6){

            print("Aprovado");

        }

        else{

            print("Reprovado");

        }

    }

}