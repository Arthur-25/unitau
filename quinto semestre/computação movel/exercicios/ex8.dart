import 'dart:io';

void main(){

    int valorNumerico;

    print("Digite um numero");

    valorNumerico = int.parse(stdin.readLineSync()!);

    double vinteCinco = (valorNumerico*25)/100;

    double cinquenta = (valorNumerico*50)/100;

    double cem = (valorNumerico*100)/100;

    double centoECinquenta = (valorNumerico*150)/100;

    print("25% de $valorNumerico é: $vinteCinco");

    print("50% de $valorNumerico é: $cinquenta");

    print("100% de $valorNumerico é: $cem");

    print("150% de $valorNumerico é: $centoECinquenta");
}