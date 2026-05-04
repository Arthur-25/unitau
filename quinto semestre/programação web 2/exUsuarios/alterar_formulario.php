<!DOCTYPE html>
<html>

<head>
    <title>CRUD</title>
</head>

<body>

    <?php
    $codigo = $_GET['codigo'];

    //Incluindo o arquivo de conexão no banco de dados
    require_once("database.php");

    //Definindo a query
    $SQL = "SELECT * FROM usuarios WHERE codigo = $codigo";

    //Guarda a busca no array $resultado
    $resultado = $conexao->query($SQL);
    
    //Percorrendo todos os registros
    while ($linha = $resultado->fetch(PDO::FETCH_OBJ)) {
        $codigo = $linha->codigo;
        $nome = $linha->nome;
        $cpf = $linha->cpf;
        $rg = $linha->rg;
        $cep = $linha->cep;
        $numero = $linha->numero;
        $observacoes = $linha->observacoes;
    }

    ?>

    <p>O objetivo desse exercício é o de demonstrar
        como se conectar em um banco de dados e alterar um registro</p>

    <form method="POST" action="alterar_processamento.php">

        <!-- Código: -->
        <input type="hidden" id="codigo" name="codigo" value="<?php echo $codigo; ?>" />

        nome:<br />
        <input type="text" id="nome" name="nome" size="50" value="<?php echo $nome; ?>" />

        <br /><br />

        cpf:<br />
        <input type="text" id="cpf" name="cpf" size="50" value="<?php echo $cpf; ?>" />

        <br /><br />

        rg:<br />
        <input type="text" id="rg" name="rg" size="20" value="<?php echo $rg; ?>"/>

        <br /><br />

        cep:<br />
        <input type="text" id="cep" name="cep" size="20" value="<?php echo $cep; ?>"/>

        <br /><br />

        numero:<br />
        <input type="text" id="numero" name="numero" size="20" value="<?php echo $numero; ?>"/>

        <br /><br />

        Observações:<br />
        <input type="text" id="observacoes" name="observacoes" size="20" value="<?php echo $observacoes; ?>"/>

        <br /><br />

        <input type="submit" value="Salvar" />
        <input type="reset" value="Limpar" />
    </form>
</body>

</html>