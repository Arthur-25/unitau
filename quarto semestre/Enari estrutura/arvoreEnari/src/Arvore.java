public class Arvore {
    public Node raiz;

    public Arvore(){
        raiz = null;
    }
    public void add(int valor){
        if (raiz !=null){
            raiz.add(valor,null);
        }
        else{
            raiz = new Node(valor);
        }
    }// fim da função add
    public void show(){
        if (raiz!=null){
            raiz.show();
        }
        else{
            System.out.println("Arvore vazia");
        }
    }// fim da função show
    public int calculaAltura(){
        if (raiz!=null){
            return raiz.calculaAltura();
        }else{
            return 0;
        }
    }//fim da função calcular altura
    public boolean  verificaBalanceamento(){
        if (raiz!=null){
            //retorna true se estiver desbalanceada senão retorna false
            return raiz.verificaBalanceamento();
        }else{
            System.out.println("Arvore vazia");
            return false;
        }
    }//fim da função que verifica balanceamento

    public void ajustaArvore(){
        while (verificaBalanceamento()) {
            raiz.ajustaArvore(this);
        }//else{
            System.out.println("Arvore está balanceada");
        //}


    }
}
