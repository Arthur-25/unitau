import 'dart:io';

void main(){

    int soma = 0;

    for (int i = -200; i<= 200; i++){

        if (i % 5 == 0){

            soma += i;

        }

    }

    print(soma);

}