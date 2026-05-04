import 'dart:io';

void main(){

    int valorNumerico;

    print("Digite um valor numerico");

    valorNumerico = int.parse(stdin.readLineSync()!);

    int valorAnterior = valorNumerico - 1;

    print("O numero que vem antes de $valorNumerico é: $valorAnterior");
}