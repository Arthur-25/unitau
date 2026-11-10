public class Main2 {
    public static void main(String[]args){

        Arvore A = new Arvore();
        A.add(3);
        A.add(2);
        A.add(1);

        System.out.println("\n ARVORE A \n");

        A.show();
        //System.out.println(A.raiz.esq.verificaBalanceamento());
        System.out.println();

        A.ajustaArvore();
        A.show();



        Arvore B = new Arvore();


        B.add(2);
        B.add(4);
        B.add(1);
        B.add(3);
        B.add(5);
        B.add(7);

        System.out.println("\n ARVORE B \n");

        B.show();
        B.ajustaArvore();
        B.show();



        System.out.println("\n ARVORE C \n");
        Arvore C = new Arvore();
        C.add(3);
        C.add(1);
        C.add(2);

        C.show();
        C.ajustaArvore();
        C.show();



        System.out.println("\n ARVORE D \n");
        Arvore D = new Arvore();
        D.add(1);
        D.add(3);
        D.add(2);
        D.show();
        D.ajustaArvore();
        D.show();

    }


}
