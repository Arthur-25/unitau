import "dart:io";

void main(){

    int valorNumerico;

    print("Digite um numero");

    valorNumerico = int.parse(stdin.readLineSync()!);

    int valorPosterior = valorNumerico + 1;

    print("O numero que vem depois de $valorNumerico é: $valorPosterior");
}