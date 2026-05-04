<!DOCTYPE html>
<html>

<head>
    <title>CRUD</title>
</head>

<body>

    <p>O objetivo desse exercício é o de demonstrar
        como se conectar em um banco de dados e inserir um registro</p>

    <?php

    $codigo = trim($_POST['codigo']);
    $nome = trim($_POST['nome']);
    $cpf = trim($_POST['cpf']);
    $rg = trim($_POST['rg']);
    $cep = trim($_POST['cep']);
    $numero = trim($_POST['numero']);
    $observacoes = trim($_POST['observacoes']);

    // Dados mockados
    // $codigo = "14";

    if (($codigo == "") || ($nome == "") || ($cpf == "") || ($rg == "")|| ($cep == "")|| ($numero == "")|| ($observacoes == "")) {
        echo "Há registros em branco!";
        return;
    }

    //Incluindo o arquivo de conexão no banco de dados
    require_once("database.php");

    //Definindo a query
	$SQL = "UPDATE usuarios " .
    "SET nome = :nome, cpf = :cpf, rg = :rg, cep = :cep, numero = :numero, observacoes = :observacoes" .
    " WHERE codigo = :codigo ";

	$statement = $conexao->prepare($SQL);
	$statement->bindParam(':codigo', $codigo);
	$statement->bindParam(':nome', $nome);
	$statement->bindParam(':cpf', $cpf);
	$statement->bindParam(':rg', $rg);
	$statement->bindParam(':cep', $cep);
    $statement->bindParam(':numero', $numero);
    $statement->bindParam(':observacoes', $observacoes);
	if ($statement->execute()){
        echo "Registro alterado com sucesso";
    }
    else{
        echo "Falha ao alterar o registro";
    }

    //Fechando a conexão com o banco de dados
    unset($conexao);
    ?>

    <br /><br />
    <a href="index.php">Listar registros</a>

</body>

</html>