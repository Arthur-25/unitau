import "dart:io";

void main(){

    int numero;

    print("Digite um numero:");

    numero = int.parse(stdin.readLineSync()!);

    String verificaSePositivo = (numero > -1) ? "positivo" : "negativo";

    print(verificaSePositivo);

}