

<!DOCTYPE html>
<html>

<head>
    <title>Exercício 01</title>
</head>

<body>

    <?php
    
        //Recebendo os valores via GET
        $valor1 = $_GET['valor1'];
        $valor2 = $_GET['valor2'];

        //Processando o resultado
        $resultado = $valor1 + $valor2;

        //Exibindo o resultado
        echo "O valor da soma de $valor1 + $valor2 é: " . $resultado;
    ?>

</body>

</html>

