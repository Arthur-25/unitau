import java.util.Scanner;
import java.util.Locale;
public class Main {
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Scanner sc = new Scanner(System.in);
        int[] par = new int[5];
        int[] impar = new int[5];
        //x conta os pares e y os impares
        int x=0,y=0;
        for (int i = 0;i<15;i++){
            int valor = sc.nextInt();
            if (valor%2 == 0 && x<5){
                par[x] = valor;
                x++;
            }
            else {
                x = 0;
                for (int n = 0;n<5;n++) {
                    System.out.printf("par[%d] = %d%n", n, par[n]);
                    par[n] = 0;
                }
            }
            if (valor%2 != 0 && y<5){
                impar[y] = valor;
                y++;
            }else {
                y = 0;
                for (int n = 0;n<5;n++) {
                    System.out.printf("impar[%d] = %d%n", n, impar[n]);
                    impar[n] = 0;
                }
            }
        }//fim do for
        for (int i = 0;i<5;i++){
            if (impar[i] != 0) System.out.printf("impar[%d] = %d%n", i, impar[i]);
        }
        for (int i = 0;i<5;i++){
            if (par[i] != 0) System.out.printf("par[%d] = %d%n", i, par[i]);
        }
    }
}