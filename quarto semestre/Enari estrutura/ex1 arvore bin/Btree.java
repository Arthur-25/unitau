import java.util.ArrayList;

public class Btree {

    public Bnode raiz;

    public Btree(){
        raiz = null;
    }

    public void add(int valor){

        if(raiz != null){
            raiz.add(valor);
        } else{
            raiz = new Bnode(valor);
        }
    }

   public void show(){
        if(raiz != null){
            raiz.show();
        } else{
            System.out.println("Arvore vazia!!");
        }
   }

   public boolean buscar( int valor){
        if(raiz != null){
            if (raiz.buscar(valor) == 1){
                return true;
            }else{
                return false;
            }
        } else {
            System.out.print("Arvore vazia");
            return false;
        }
   }

   public int maior(){
        if(raiz != null){
            return raiz.maior();
        } return 0;
   }

   public int menor(){
       if(raiz != null){
           return raiz.menor();
       } return 0;
   }
    public int altura(){
        if (raiz != null){
            return raiz.altura();
        } return 0;
    }
    public int contarFolhas(){
        if(raiz != null){
            return raiz.contarFolhas();
        }
        return 0;

    }
    public int contarNos() {
        if (raiz != null) {
            return raiz.contarNos();
        }
        return 0;
    }
    public int encontrarProfundidade(int valor){
        if (raiz!= null){
            if (raiz.encontrarProfundidade(valor, 1)!=0) return raiz.encontrarProfundidade(valor, 1);
            else return -1;
        }else{
            return -1;
        }
    }

    public boolean validarArvore(){
        if (raiz!= null){
            if (raiz.validarArvore(raiz.x) == 1) return true;
        }else{
            return false;
        }
        return false;
    }

    public boolean saoIguais(Btree arvore2){
        try {
            if (raiz.saoIguais(arvore2.raiz) == 1) return true;
        } catch (Exception e) {
            return false;
        }
        return false;
    }
    public boolean saoSimilares(Btree arvore2){
        try {
            if (raiz.saoSimilares(arvore2.raiz) == 1) return true;
        } catch (Exception e) {
            return false;
        }

        return false;
    }

    public void inverterArvore(){
        if (raiz!= null){
            raiz.inverterArvore();
        }else{
            System.out.println("Arvore vazia");
        }
    }

    public void encontrarCaminho(int valor){
        if (raiz!=null && buscar(valor)) raiz.encontrarCaminho(valor);
        else System.out.println("");
    }

    public int encontrarSucessor(int valor){
        if (raiz!=null && buscar(valor)) return raiz.encontrarSucessor(valor, 99999);
        else return -1;
    }

    public int encontrarLCA(int P, int Q){
        if (raiz!= null && buscar(P) && buscar(Q)){
            return raiz.encontrarLCA(P,Q);
        }else{
            return -1;
        }
    }

    public void imprimirNivel(int k){
        if (raiz!=null && k<=altura()){
            raiz.imprimirNivel(k,1);
        }
    }
    public int somarNivel(int k){
        if (raiz!=null && k<=altura()){
            return raiz.somarNivel(k,1);
        }
        return -1;
    }
    public void percursoEmLargura(){
        if (raiz!=null){
            for (int i = 1;i<=altura();i++)  raiz.imprimirNivel(i,1);
        }
    }
}