package programaEscrever;

public class Node {
    public char letra;
    public int frequencia;
    public Node esq,dir;

    public Node(char L, int F){
        letra = L;
        frequencia = F;
        esq = dir = null;
    }
    public void add(Node aux){
        if (aux.frequencia<frequencia) {
            if (esq != null) {
                esq.add(aux);
            }else{
                esq = aux;
            }
        }

        if (aux.frequencia>=frequencia) {
            if (dir != null) {
                dir.add(aux);
            }else {
                dir = aux;
            }
        }
    }

    public void show(){
        if (letra == 'ç') System.out.println("-" + frequencia);
        else if (letra != ' ') System.out.println(letra + "-" + frequencia);
        else System.out.println("Espaço-" + frequencia);
        if (esq!=null) {
            System.out.println("Esquerda");
            esq.show();
        }
        if (dir!=null) {
            System.out.println("Direita");
            dir.show();
        }
    }

    public String encontraCaminho(char C, String caminhoAtual){
// 1. Caso Base: Se este nó é uma folha e sua letra é a que procuramos
        //    Retorna o caminho acumulado até agora.
        if (this.letra == C) {
            return caminhoAtual;
        }

        // 2. Condição de Parada para nós intermediários:
        //    Se este nó não é a letra que procuramos e não tem filhos,
        //    significa que o caractere não está nesta ramificação.
        //    Retorna null para indicar que não foi encontrado aqui.
        if (this.esq == null && this.dir == null) {
            return null;
        }

        // 3. Busca na subárvore esquerda:
        //    Se houver um filho à esquerda, chama recursivamente, adicionando "0" ao caminho.
        String resultadoEsquerda = null;
        if (this.esq != null) {
            resultadoEsquerda = this.esq.encontraCaminho(C, caminhoAtual + "0");
            // Se encontrou na esquerda, retorna imediatamente.
            if (resultadoEsquerda != null) {
                return resultadoEsquerda;
            }
        }

        // 4. Busca na subárvore direita:
        //    Se houver um filho à direita E ainda não encontrou na esquerda,
        //    chama recursivamente, adicionando "1" ao caminho.
        String resultadoDireita = null;
        if (this.dir != null) {
            resultadoDireita = this.dir.encontraCaminho(C, caminhoAtual + "1");
            // Se encontrou na direita, retorna imediatamente.
            if (resultadoDireita != null) {
                return resultadoDireita;
            }
        }

        // 5. Se não encontrou em nenhuma das ramificações
        return null;
    }
}
