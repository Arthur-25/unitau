import 'dart:io';

void main(){

    int nota1;

    int nota2;

    int nota3;

    int nota4;

    print("Digite as 4 notas");

    nota1 = int.parse(stdin.readLineSync()!);

    nota2 = int.parse(stdin.readLineSync()!);

    nota3 = int.parse(stdin.readLineSync()!);

    nota4 = int.parse(stdin.readLineSync()!);

    double media = (nota1 + nota2 + nota3 + nota4)/4;

    print("Media das notas é: $media");
}