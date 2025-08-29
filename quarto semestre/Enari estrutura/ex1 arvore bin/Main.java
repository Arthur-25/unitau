public class Main {
    public static void main(String[] args) {

        //int[] arvore = {20,10,30,40,50,2,0,-1,1};
        //int[] arvore = {20,8,22,4,12,10,14};
        //int[] arvore = {10,5,15}; //arvore de exemplo do exercicio  10 e 9
        //int[] arvore = {4,2,1,3,7,6,9}; //arvore do exercicio 11
        //int[] arvore = {20,22,8,4,12,10,14}; //arvore do exercicio 12
        int[] arvore = {3,20,15}; //arvore ex 15 e 16 e 17

        Btree arv = new Btree();
        //Btree arv2 = new Btree();
        for(int i = 0; i<arvore.length;i++){
            arv.add(arvore[i]);
            //arv2.add(arvore[i]);
        }

        //arv.add(11);
        //arv2.add(13);
        // adicionando valores para testar o exercicio 10 e 9

        arv.raiz.esq = new Bnode(9);
        arv.raiz.dir.dir = new Bnode(7);
        //adicionando valores para testar os exercicios 15 e 16 e 17

        /*
        arv.add(10);
        arv.add(5);
        arv.raiz.esq.dir = new Bnode(20);
        criando arvore falsa para o exercicio 8
        */

        //arv.show();

        //Ex1
        //System.out.println(arv.buscar(30));

        //Ex2
        //System.out.println(arv.maior());

        //Ex3
        //System.out.println(arv.menor());

        //Ex4
        //System.out.println(arv.altura());

        //Ex5
        //System.out.println(arv.contarFolhas());

        //Ex6
        //System.out.println(arv.contarNos());

        //Ex7
        //System.out.println(arv.encontrarProfundidade(15));

        //EX 8
        //System.out.println(arv.validarArvore());

        //EX9
        //System.out.println(arv.saoIguais(arv2));

        //EX10
        //System.out.println(arv.saoSimilares(arv2));

        //EX 11
        //System.out.println("Arvore invertida");
        //arv.inverterArvore();
        //arv.show();

        //EX12
        //arv.encontrarCaminho(10);

        //EX13
        //System.out.println(arv.encontrarSucessor(4));

        //EX14
        //System.out.print(arv.encontrarLCA(8,14));

        //EX15
        //arv.imprimirNivel(2);

        //EX16
        //System.out.println(arv.somarNivel(2));

        //EX17
        arv.percursoEmLargura();
    }
}