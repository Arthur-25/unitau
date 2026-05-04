import 'dart:io';

void main(){

    int valorNumerico;

    print("Digite um valor numerico");

    valorNumerico = int.parse(stdin.readLineSync()!);

    int dobro = valorNumerico*2;

    int triplo = valorNumerico*3;

    print("O dobro de $valorNumerico é: $dobro");
    print("O triplo de $valorNumerico é: $triplo");
}