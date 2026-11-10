public class Main {
    public static void main(String[] args) {
        Arvore A = new Arvore();
        A.add(10);
        A.add(5);
        A.add(3);
        A.add(13);

        //A.show();
        //System.out.println(A.calculaAltura());
        //System.out.println(A.verificaBalanceamento());

        A.add(6);
        A.add(7);

        /*
        System.out.println("Pos desbalanceamento");
        System.out.println(A.verificaBalanceamento());
        */

        A.show();
        A.ajustaArvore();
        System.out.println("\nPos balanceamento\n");
        A.show();

    }
}