import java.sql.SQLOutput;

public class Bnode {

    public Bnode esq, dir;
    public int x;

    public Bnode ( int valor){
        x = valor;
        esq = dir = null;
    }
    public void add( int valor){
        if(valor <= x ) { //adiciona na esquerda se o numero que ta entrando for menor ou igual a o da raiz
            if(esq != null){
                esq.add(valor);
            } else{
                esq = new Bnode(valor);
            }
        }if(valor>x){//adiciona na direita pqele é maior que a raiz
            if(dir !=null){
                dir.add(valor);
            }else{
                dir = new Bnode(valor);
            }
        }
    }
    public void show(){
        if(esq != null){
            esq.show();
        }
        System.out.println(x);
        if (dir != null){
            dir.show();
        }
    }

    public int buscar(int valor){
        int esquerda = 0;
        int direita = 0;
        if(esq != null){
           esquerda = esq.buscar(valor);
        } if (dir != null){
            direita = dir.buscar(valor);
        }
        if (valor == x) return 1;
        return esquerda + direita;
    }

    public int maior(){

        int direita = 0;
        direita = x;
        if(dir != null){
            direita = dir.maior();
        }

        return direita;
    }

    public int menor(){

        int esquerda = 0;
        esquerda = x;
        if(esq != null){
            esquerda = esq.menor();
        }

        return esquerda;
    }

    public int altura(){
        int altesquerda = 0;
        int altdireita = 0;

        if (esq != null){
            altesquerda = esq.altura();
        }
        if (dir != null){
            altdireita = dir.altura();
        }
        if (altesquerda>altdireita){
            altdireita = 0;
        }else{
            altesquerda = 0;
        }
        return 1 + altesquerda + altdireita;


    }

    public int contarFolhas(){
        int direita = 0;
        int esquerda = 0;
        System.out.println(x);
        if (esq == null && dir == null){
            return 1;
        }
        if (dir != null){
            direita = dir.contarFolhas();
        }
        if (esq != null){
            esquerda = esq.contarFolhas();
        }
        return direita + esquerda;
    }
    public int contarNos(){
        int direita = 0;
        int esquerda = 0;

        if (esq == dir) return 0;

        if (dir != null){
            direita = dir.contarNos();
        }
        if (esq != null){
            esquerda = esq.contarNos();
        }

        return 1 + direita + esquerda;
    }
    public int encontrarProfundidade(int valor, int prof){
        int esquerda = 0;
        int direita = 0;
        if(esq != null){
            esquerda = esq.encontrarProfundidade(valor,prof + 1);
        } if (dir != null){
            direita = dir.encontrarProfundidade(valor, prof + 1);
        }
        if (valor == x) return prof;
        return direita + esquerda;
    }

    public int validarArvore(int valor){
        int validar = 1;

        if(esq != null){
            //esq.show();
            validar = esq.validarArvore(x);
        }

        if (dir != null){
            //dir.show();
            validar = dir.validarArvore(x);
        }
        if (x<valor) return 0;
        return validar;
    }

    public int saoIguais(Bnode caminho){
        int validar = 1;
        if(esq != null){
            validar = esq.saoIguais(caminho.esq);

        }
        //System.out.println("Valor atual da raiz 1 " + this.x);
        //System.out.println("Valor atual da raiz 2 " + caminho.x);
        if (dir != null){
            validar = dir.saoIguais(caminho.dir);

        }
        if (this.x != caminho.x) return 0;
        return validar;
    }

    public int saoSimilares(Bnode caminho){
        int validar = 1;
        int proxArvore2;
        if (esq!= null){
            validar = esq.saoSimilares(caminho.esq);
            proxArvore2 = caminho.esq.x;
        }

        if (dir != null){
            validar = dir.saoSimilares(caminho.dir);
            proxArvore2 = caminho.dir.x;
        }

        return validar;
    }

    public void inverterArvore(){
        Bnode esquerda, direita;
        esquerda = esq;
        direita = dir;

        if (esq!=dir) {
            esq = direita;
            dir = esquerda;
        }

        if (esq!=null){
            esq.inverterArvore();
        }
        if (dir!=null){
            dir.inverterArvore();
        }
    }

    public void encontrarCaminho(int valor){
        if (x!=valor) {
            System.out.print(x + " - ");
            if (valor < x) esq.encontrarCaminho(valor);
            if (valor>x) dir.encontrarCaminho(valor);
        }else{
            System.out.print(x);
        }
    }

    public int encontrarSucessor(int valor, int dif){

        //System.out.println("Valor de x = " + x + " valor de dif = " + dif + " começo da função");
        int diferenca = valor-x;
        if (diferenca<0) diferenca *= -1;
        if (diferenca<dif && valor-x!=0){
            //System.out.println("Entrou no if");
            dif = diferenca;
        }


        //System.out.println("Valor do dif = " + dif  + " depois de entrar ou não no if");

        if(esq != null){
            dif = esq.encontrarSucessor(valor,dif);
        }
        //System.out.println("Valor de dif = " + dif + " apos passar pelo esquerdo");
        if (dir != null){
            dif = dir.encontrarSucessor(valor,dif);
        }
        //System.out.println("Valor de dif = " + dif + " apos passar pelo direito");
        return dif;
    }

    public int encontrarLCA(int P, int Q){
        if (P<x && Q<x && esq!=null){
            return esq.encontrarLCA(P,Q);
        }
        if (P>x && Q>x && dir!=null){
            return dir.encontrarLCA(P,Q);
        }
        return x;
    }

    public void imprimirNivel(int k, int nivel){
        if (k==nivel) System.out.println(x);

        if(esq != null){
            esq.imprimirNivel(k,nivel+1);
        }

        if (dir != null){
            dir.imprimirNivel(k,nivel+1);
        }
    }
    public int somarNivel(int k, int nivel){
        int soma = 0;

        if(esq != null){
            soma += esq.somarNivel(k,nivel+1);
        }

        if (dir != null){
            soma += dir.somarNivel(k,nivel+1);
        }
        if (k==nivel) return x + soma;
        return soma;
    }
    public void percursoEmLargura(int nivel){
        imprimirNivel(nivel, 1);
        System.out.println("Nivel atual = " + nivel + " Valor de x = " + x);
        if (esq!=null) esq.percursoEmLargura(nivel+1);
        if (dir!=null) dir.percursoEmLargura(nivel+1);
    }
}
