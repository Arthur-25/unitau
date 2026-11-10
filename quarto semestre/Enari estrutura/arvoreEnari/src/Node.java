public class Node {
    public int x, fatorBalanceamento;
    public Node pai,esq,dir;

    public Node(int valor){
        this.x = valor;
        this.fatorBalanceamento = 0;
        this.pai = this.esq = this.dir = null;
    }
    public void add(int valor, Node novoPai){
        // esquerda
        if (valor<x){
            if (esq!=null){
                esq.add(valor, this);
            }else{
                esq = new Node(valor);
                esq.pai = this;
            }
        }
        // direita
        if (valor>=x){
            if (dir!=null){
                dir.add(valor,this);
            }else{
                dir = new Node(valor);
                dir.pai = this;
            }
        }
    }// fim função add
    public void show(){
        if (pai!=null) System.out.println(x + " pai = " + pai.x);
        else System.out.println(x);

        if (esq!=null) {
            System.out.println("A esquerda de " + x);
            esq.show();
        }

        if (dir!=null){
            System.out.println("A direita de " + x);
            dir.show();
        }
    }//fim da função show

    public int calculaAltura(){
        int esquerdo = 0;
        int direito = 0;

        if (esq!=null) esquerdo = esq.calculaAltura();
        if (dir!=null) direito = dir.calculaAltura();
        int maior = Math.max(esquerdo, direito);

        return 1 + maior;
    }//fim da função calculaAltura

    public boolean verificaBalanceamento(){
        int alturaDir = 0;
        int alturaEsq = 0;

        if (dir!=null) alturaDir = dir.calculaAltura();
        if (esq!=null) alturaEsq = esq.calculaAltura();

        fatorBalanceamento = alturaDir - alturaEsq;

        if (esq!=null && esq.verificaBalanceamento()) return esq.verificaBalanceamento();
        if (dir!=null && dir.verificaBalanceamento()) return dir.verificaBalanceamento();

        if (fatorBalanceamento>1 || fatorBalanceamento< -1) return true;
        return false;
    }

    public void ajustaArvore(Arvore A){
        int alturaDir = 0;
        int alturaEsq = 0;

        if (dir!=null) alturaDir = dir.calculaAltura();
        if (esq!=null) alturaEsq = esq.calculaAltura();


        fatorBalanceamento = alturaDir - alturaEsq;

        //se estiver desbalanceado
        if (fatorBalanceamento>1 || fatorBalanceamento< -1  ){

            Node N = this;
            Node L = N.esq;
            Node LR = null;
            if (L!=null){
                LR = L.dir;
            }

            Node R = N.dir;
            Node RL = null;
            if (R!=null) {
                RL = R.esq;
            }

            //caso desbalanceamento seja na esquerda
            if (alturaEsq>alturaDir) {
                int fatorBalanceamentoL = L.fatorBalanceamento;

                if (fatorBalanceamentoL > 0) {
                    System.out.println("Desbalanceamento na esquerda: Rotação dupla esquerda-direita");

                    L.dir = LR.esq;
                    if (L.dir!=null) L.dir.pai = L;

                    LR.esq = L;
                    L.pai = LR;

                    N.esq = LR;
                    LR.pai = N;

                    L = LR;

                } else {

                    System.out.println("Desbalanceado na esquerda: rotação simples para direita");

                    //um if para ajustar a raiz da arvore
                    if (N.pai == null) {
                        L.pai = N.pai;
                        A.raiz = L;
                    }

                    L.dir = N;
                    this.esq = LR;
                    if (LR != null) LR.pai = this;
                    this.pai = L;

                }
            }

            if (alturaDir>alturaEsq && R!=null){
                int fatorBalanceamentoR = R.fatorBalanceamento;

                if (fatorBalanceamentoR<0){
                    System.out.println("Desbalanceamento na direita: rotação dupla direita-esquerda");
                    R.esq = RL.dir;
                    if (R.esq!=null) R.esq.pai = R;

                    RL.dir = R;
                    R.pai = RL;

                    N.dir = RL;
                    RL.pai = N;

                    R = RL;

                }else {


                    System.out.println("Desbalanceado na direita: rotação simples para esquerda");
                    //if para ajustar a raiz da arvore
                    if (N.pai == null) {

                        A.raiz = R;
                    }
                    else if (N.pai.esq == N){
                        N.pai.esq = R;
                    }
                    else{
                        N.pai.dir = R;
                    }

                    R.pai = N.pai;

                    N.dir = R.esq;
                    if (N.dir != null) N.dir.pai = N;

                    R.esq = N;
                    N.pai = R;
                }
            }

        }
    }//fim da função que ajusta a arvore para balancear ela

}
