import 'dart:io';

void main(){

    print("Digite o valor inicial");

    int valor_inicial = int.parse(stdin.readLineSync()!);

    print("Digite o valor final");

    int valor_final = int.parse(stdin.readLineSync()!);

    int soma = 0;

    for (int i = valor_inicial; i <= valor_final; i++){

        print(i);

        soma += i;

    }

    double mediaAritmetica = soma / (valor_final - valor_inicial);

    print("Media aritmetica: $mediaAritmetica");

}