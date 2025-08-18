import java.util.Scanner;
import java.util.Locale;
public class Main {
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Scanner sc = new Scanner(System.in);
        int[] F = new int[61];
        F[0] = 0;
        F[1] = 1;
        for (int i = 2;i<61;i++){
            F[i] = 0;
            F[i] += F[i-1];
            F[i] += F[i-2];
            if (i==51){
                System.out.println(F[i-1] + " + " + F[i-2] + " = " + F[i]);
            }
            if (i==48){
                System.out.println(F[i-1] + " + " + F[i-2] + " = " + F[i]);
            }
            if (F[i]<0){
                System.out.println("Posição: " + i);
                System.out.println(F[i-1] + " + " + F[i-2] + " = " + F[i]);
            }
        }
        int T = sc.nextInt();
        for (int i = 0;i<T;i++){
            int N = sc.nextInt();
            System.out.printf("Fib(%d) = %d%n", N,F[N]);
        }
    }
}