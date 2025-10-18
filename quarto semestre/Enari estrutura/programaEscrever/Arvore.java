package programaEscrever;

public class Arvore {
    public Node raiz;

    public Arvore(){
        raiz = new Node('ç',0);
    }

    public void add(Node aux,Node aux2){
        if (raiz!=null){
            raiz.esq=aux;
            raiz.dir = aux2;
            raiz.frequencia = aux.frequencia + aux2.frequencia;
        }
    }

    public void addSingular(Node aux){
        raiz.dir = aux;
        raiz.frequencia = aux.frequencia;
    }

    public void show(){
        if (raiz!=null) raiz.show();
        else System.out.println("Arvore vazia");
    }

    public String encontraCaminho(char C){
        return raiz.encontraCaminho(C, "");
    }

}
