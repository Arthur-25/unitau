import 'dart:io';

void main(){

    const VALOR_INICIAL = 53;

    const VALOR_FINAL = 521;

    int i = VALOR_INICIAL;

    while(i <= VALOR_FINAL){

        if (i % 2 == 0){

            print(i);

        }
        

        i++;

    }

}