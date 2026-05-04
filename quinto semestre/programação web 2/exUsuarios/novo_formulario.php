<!DOCTYPE html>
<html>

<head>
    <title>CRUD</title>
</head>

<body>

    <p>O objetivo desse exercício é o de demonstrar
        como se conectar em um banco de dados e inserir um registro</p>

    <form method="POST" action="novo_processamento.php">
        Nome:<br />
        <input type="text" id="nome" name="nome" size="300"/>

        <br /><br />

        cpf:<br />
        <input type="text" id="cpf" name="cpf" size="11"/>

        <br /><br />
        
        rg:<br />
        <input type="text" id="rg" name="rg" size="20"/>

        <br /><br />

        cep:<br />
        <input type="text" id="cep" name="cep" size="10"/>

        <br /><br />

        numero:<br />
        <input type="text" id="numero" name="numero" size="10"/>

        <br /><br />

        observações:<br />
        <input type="text" id="observacoes" name="observacoes" size="2000"/>

        <br /><br />

        <input type="submit" value="Cadastrar" />
        <input type="reset" value="Limpar" />
    </form>
</body>

</html>