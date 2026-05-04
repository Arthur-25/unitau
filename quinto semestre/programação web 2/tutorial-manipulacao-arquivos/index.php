<?php

// Define o nome do arquivo onde o texto será gravado
$nomeArquivo = 'meu_arquivo.txt';

// O texto que você deseja gravar no arquivo
$textoParaGravar = "Esta é uma linha de texto que será gravada no arquivo.\n";
$textoParaGravar .= "Esta é outra linha de texto.\n";
$textoParaGravar .= "PHP é uma linguagem que consegue manipular arquivos.\n";

// Verifica se o arquivo existe
if (file_exists($nomeArquivo)) {
    // Se o arquivo existir, tenta removê-lo
    if (unlink($nomeArquivo)) {
        echo "Arquivo '$nomeArquivo' removido com sucesso.\n";
    } else {
        echo "Erro ao tentar remover o arquivo '$nomeArquivo'. Verifique as permissões.\n";
        // Se não conseguir remover, é importante sair para não tentar gravar em um arquivo problemático
        exit;
    }
} else {
    echo "Arquivo '$nomeArquivo' não existia e será criado.\n";
}

// Abre o arquivo no modo de escrita ('w')
// O modo 'w' cria um novo arquivo ou sobrescreve um existente (já tratamos a remoção acima)
$arquivo = fopen($nomeArquivo, 'w');

// Verifica se o arquivo foi aberto com sucesso
if ($arquivo) {
    // Escreve o texto no arquivo
    if (fwrite($arquivo, $textoParaGravar) !== false) {
        echo "Texto gravado com sucesso no arquivo '$nomeArquivo'.\n";
    } else {
        echo "Erro ao gravar o texto no arquivo '$nomeArquivo'.\n";
    }

    // Fecha o arquivo para liberar os recursos do sistema
    fclose($arquivo);
} else {
    echo "Erro ao abrir o arquivo '$nomeArquivo'. Verifique as permissões ou o caminho.\n";
}

?>