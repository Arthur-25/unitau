import 'dart:io';

void main(){

    int multiplicacao = 1;

    for (int i = 255; i <= 555; i++){

        multiplicacao = multiplicacao * i;

        if (multiplicacao == 0){

            //print("i = $i multiplicacao = $multiplicacao");

        }

    }

    print(multiplicacao);

}