import 'dart:io';

void main(){

    int soma = 0;

    for (int i = -333; i <= 333; i++){

        if (i % 3 == 0){

            soma += i;

        }

    }

    print(soma);

}