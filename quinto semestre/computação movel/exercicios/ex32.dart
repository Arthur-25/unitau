import 'dart:io';

void main(){

    const VALOR_INICIAL = 521;

    const VALOR_FINAL = 53;

    int i = VALOR_INICIAL;

    while (i >= VALOR_FINAL){

        if (i % 2 != 0){

            print(i);

        }

        i--;

    }

    print("\n ================================================= \n");

    for (i = VALOR_INICIAL; i <= VALOR_FINAL; i--){

        if (i % 2 != 0){

            print(i);

        }
        
    }

}