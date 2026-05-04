<!DOCTYPE html>
<html>

<head>
    <title>CRUD</title>
</head>

<body>

    <p>O objetivo desse exercício é o de demonstrar
        como se conectar em um banco de dados e inserir um registro</p>
    <?php

    
    $nome = trim($_POST['nome']);

    $cpf = trim($_POST['cpf']);

    $rg = trim($_POST['rg']);

    $cep = trim($_POST['cep']);

    $numero = trim($_POST['numero']);

    $observacoes = trim($_POST['observacoes']);

    // Dados mockados
    // $descricao = "Sukita";
    // $modelo = "3 litros";
    // $quantidade = "999";
    // $valor = "0.99";

    if (($nome == "") || ($cpf == "") || ($rg == "")|| ($cep == "")|| ($numero == "")|| ($observacoes == "")) {
        echo "Há registros em branco!";
        return;
    }

    //Incluindo o arquivo de conexão no banco de dados
    require_once("database.php");

    //Definindo a query
	$SQL = "INSERT INTO usuarios " .
    "(nome, cpf, rg, cep, numero, observacoes)" .
    " VALUES " .
    "(:nome, :cpf, :rg, :cep, :numero, :observacoes)";

	$statement = $conexao->prepare($SQL);
	$statement->bindParam(':nome', $nome);
	$statement->bindParam(':cpf', $cpf);
	$statement->bindParam(':rg', $rg);
	$statement->bindParam(':cep', $cep);
    $statement->bindParam(':numero', $numero);
    $statement->bindParam(':observacoes', $observacoes);
    if ($statement->execute()){
        echo "Registro inserido com sucesso";
    }
    else{
        echo "Falha ao inserir o registro";
    }

    //Fechando a conexão com o banco de dados
    unset($conexao);
    ?>

    <br /><br />
    <a href="index.php">Listar registros</a>

</body>

</html>