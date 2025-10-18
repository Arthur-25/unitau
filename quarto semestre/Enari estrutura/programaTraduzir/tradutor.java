package programaTraduzir;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
/*
cd C:\Users\arthur\IdeaProjects\implementacaoHuffmanFinal\src
javac programaTraduzir/tradutor.java
java programaTraduzir.tradutor
 */
public class tradutor {
    public static void main(String[] args) throws IOException {
        String caminhoArquivoDicionario = "C:\\Users\\arthur\\IdeaProjects\\implementacaoHuffmanFinal\\src\\arquivoDicionario.txt";


        String conteudoDoArquivoDicionario = Files.readString(Paths.get(caminhoArquivoDicionario), StandardCharsets.UTF_8);

        String conteudoDicionarioLimpo = conteudoDoArquivoDicionario.replaceAll("[^a-zA-Z0-9=\\s]", "");

        String[] linhasDicionario = conteudoDicionarioLimpo.split("\n");
        //cria listas para guardar letras e seus valores binarios
        ArrayList<String> listaValoresBinarios = new ArrayList<String>();
        ArrayList<Character> listaLetras = new ArrayList<Character>();

        for (int i = 0; i<linhasDicionario.length;i++){
            String valorBinario = "";
            for (int j =4;j<linhasDicionario[i].length();j++) valorBinario+=linhasDicionario[i].charAt(j);
            listaValoresBinarios.add(valorBinario);
            listaLetras.add(encontraLetra(valorBinario,linhasDicionario));
        }

        //pegando o texto para traduzir
        String caminhoArquivoTextoTraduzir = "C:\\Users\\arthur\\IdeaProjects\\implementacaoHuffmanFinal\\src\\arquivoTextoBinario.txt";

        String conteudoDoTextoBinario = Files.readString(Paths.get(caminhoArquivoTextoTraduzir), StandardCharsets.UTF_8);
        String conteudoTextoLimpo = conteudoDoTextoBinario.replaceAll("[^a-zA-Z0-9=\\s]", "");

        System.out.println(conteudoTextoLimpo);
        String textoCompleto = "";
        String valBinario = "";
        //escrevendo o texto traduzido
        for (int i =0;i<conteudoTextoLimpo.length();i++){

            if (conteudoTextoLimpo.charAt(i)!=' ') valBinario += conteudoTextoLimpo.charAt(i);
            else {
                if (encontraLetra(valBinario,linhasDicionario)!='ç') textoCompleto+=encontraLetra(valBinario,linhasDicionario);
                valBinario = "";
            }
        }
        Files.write(Paths.get("C:\\Users\\arthur\\IdeaProjects\\implementacaoHuffmanFinal\\src\\textoCompletoTraduzido.txt"), textoCompleto.getBytes(StandardCharsets.UTF_8));

    }
    public static char encontraLetra(String binario, String[] linhas) {
        // percorre linhas do string/dicionario
        for (int i = 0; i < linhas.length; i++) {
            if (linhas[i].isEmpty()) {
                continue; // Pula a linha vazia
            }
            String valorBinario = "";
            for (int j = 4; j < linhas[i].length(); j++) {
                valorBinario += linhas[i].charAt(j);
            }
            if (valorBinario.equals(binario)) {
                return linhas[i].charAt(0);
            }
        }
        return 'ç';
    }
}
