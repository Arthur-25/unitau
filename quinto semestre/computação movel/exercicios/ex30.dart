import 'dart:io';

void main(){

    const VALOR_INICIAL = 555;

    const VALOR_FINAL = 255;

    int i = VALOR_INICIAL;

    while (i >= VALOR_FINAL){

        print(i);

        i--;

    }

    print("\n ================================================= \n");

    for (i = VALOR_INICIAL; i >= VALOR_FINAL; i--){

        print(i);

    }

}