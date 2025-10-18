package programaEscrever;
import java.nio.charset.StandardCharsets;

import java.io.IOException;
import java.util.ArrayList;
import java.nio.file.Files;
import java.nio.file.Paths;
//PARA RODAR ESTE PROGRAMA NO CMD TEM QUE Executar estes passos no cmd
/*
cd C:\Users\arthur\IdeaProjects\implementacaoHuffmanFinal\src
javac programaEscrever/MainOrganizado.java
java programaEscrever.MainOrganizado "C:\Users\arthur\IdeaProjects\implementacaoHuffmanFinal\src\nome.txt"
java programaEscrever.MainOrganizado "C:\Users\arthur\IdeaProjects\implementacaoHuffmanFinal\src\Huffman_Coding.txt"
 */
public class MainOrganizado {
    public static void main(String[]args) throws IOException {
        //prepara String que será usada

        String caminho = args[0];
        String conteudo = Files.readString(Paths.get(caminho), StandardCharsets.UTF_8);
        conteudo = conteudo.replaceAll("[^a-zA-Z0-9\\s.,!?'\":;-]", "");
        //cria duas listas com as letras e suas frequencias
        ArrayList<Character> listaLetras = contaLetras(conteudo);
        ArrayList<Integer> listaFrequencia = contaFrequencia(listaLetras,conteudo);
        //cria as listas que serão versões organizadas em ordem crescente das listas passadas
        ArrayList<Integer> listaFrequenciaOrganizada = new ArrayList<Integer>();
        ArrayList<Character> listaLetrasOrganizada = new ArrayList<Character>();

        //encontra a maior frequencia
        int maiorFrequencia = 0;
        for (int i = 0;i<listaFrequencia.size();i++) {
            if (listaFrequencia.get(i) > maiorFrequencia) maiorFrequencia = listaFrequencia.get(i);
        }

        //percorre todos os niveis de frequencia que temos
        for (int i = 0;i<=maiorFrequencia;i++){
            //percorre a lista de frequencia para organizar
            for (int j = 0; j<listaFrequencia.size();j++) {
                //se detectar que o int que estamos testando é uma frequencia na lista ele adiciona na lista organizada
                if (listaFrequencia.get(j) == i) {
                    listaFrequenciaOrganizada.add(listaFrequencia.get(j));
                    listaLetrasOrganizada.add(listaLetras.get(j));
                }
            }
        }

        //demonstra a String e depois a lista organizada
        System.out.println("Nova lista organizada");
        System.out.println(conteudo);

        //cria uma lista de arvores para depois executar a função que vai reduzir tudo a uma arvore
        ArrayList<Arvore> listaArvores = new ArrayList<Arvore>();
        if (listaFrequenciaOrganizada.size()%2==0){
            for (int i =0;i<listaFrequenciaOrganizada.size();i+=2){
                Node aux = new Node(listaLetrasOrganizada.get(i),listaFrequenciaOrganizada.get(i));
                Node aux2 = new Node(listaLetrasOrganizada.get(i+1),listaFrequenciaOrganizada.get(i+1));

                Arvore A = new Arvore();
                A.add(aux,aux2);
                listaArvores.add(A);
            }
        }else{
            for (int i =0;i<listaFrequenciaOrganizada.size()-1;i+=2){
                Node aux = new Node(listaLetrasOrganizada.get(i),listaFrequenciaOrganizada.get(i));
                Node aux2 = new Node(listaLetrasOrganizada.get(i+1),listaFrequenciaOrganizada.get(i+1));

                Arvore A = new Arvore();
                A.add(aux,aux2);
                listaArvores.add(A);
            }
            Arvore A = new Arvore();
            Node aux = new Node(listaLetrasOrganizada.getLast(),listaFrequenciaOrganizada.getLast());
            A.raiz = aux;
            listaArvores.add(A);
        }

        Arvore arvoreFinal = juntaArvores(listaArvores);
        

        String dicionario = "";
        for (int i =0; i<listaLetrasOrganizada.size();i++) dicionario += listaLetrasOrganizada.get(i) + " = " + arvoreFinal.encontraCaminho(listaLetrasOrganizada.get(i)) + "\n";


        Files.write(Paths.get("C:\\Users\\arthur\\IdeaProjects\\implementacaoHuffmanFinal\\src\\arquivoDicionario.txt"), dicionario.getBytes(StandardCharsets.UTF_8));

        String textoBinario = "";
        for (int i =0;i<conteudo.length();i++) textoBinario +=  arvoreFinal.encontraCaminho(conteudo.charAt(i)) + " ";

        Files.write(Paths.get("C:\\Users\\arthur\\IdeaProjects\\implementacaoHuffmanFinal\\src\\arquivoTextoBinario.txt"), textoBinario.getBytes(StandardCharsets.UTF_8));
    }

    public static ArrayList<Character> contaLetras(String palavra){
        ArrayList<Character> lista = new ArrayList<Character>();
        //adiciona a primeira letra na lista
        lista.add(palavra.charAt(0));
        //percorre a palavra passada como parametro
        for (int i =0;i<palavra.length();i++){
            //pega letra atual
            char c = palavra.charAt(i);
            //variavel que é true até encontrar a letra atual na lista/ letra repetida
            boolean t = true;

            //encontra o char na lista
            for (int j = 0;j<lista.size();j++) {
                //se a letra atual estiver na lista
                if (lista.get(j) == c) {
                    t = false;
                }
            }
            if (t) lista.add(c);
        }
        return lista;
    }//fim da função que verifica a quantidade de letras

    public static ArrayList<Integer> contaFrequencia(ArrayList<Character> lista, String palavra){
        ArrayList<Integer> listaFrequencia = new ArrayList<Integer>();
        //percorre a lista
        for (int i = 0;i<lista.size();i++){
            char c = lista.get(i);
            //percorre a palavra
            int contador = 0;
            for (int j = 0;j<palavra.length();j++){
                if (c==palavra.charAt(j)) contador++;
            }
            listaFrequencia.add(contador);
        }
        return listaFrequencia;
    }//fim da função que conta a frequencia de cada letra

    public static Arvore juntaArvores(ArrayList<Arvore> listaArvores){
        ArrayList<Arvore> listarArvores = new ArrayList<Arvore>();
        if (listaArvores.size()%2==0) {
            for (int i = 0; i < listaArvores.size(); i += 2) {
                Arvore C = new Arvore();
                C.add(listaArvores.get(i).raiz, listaArvores.get(i + 1).raiz);
                listarArvores.add(C);
            }
        }else {
            for (int i = 0; i < listaArvores.size() - 1; i +=2) {
                Arvore C = new Arvore();
                C.add(listaArvores.get(i).raiz, listaArvores.get(i + 1).raiz);
                listarArvores.add(C);

            }
            listarArvores.add(listaArvores.getLast());
        }
        if (listaArvores.size()==1){
            return listaArvores.getFirst();
        }
        else return juntaArvores(listarArvores);
    }//fim da função que retorna a arvore de huffman
}
