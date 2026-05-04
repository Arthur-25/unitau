<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

        $valor_inicial = $_GET['valor_inicial'];

        $valor_final = $_GET['valor_final'];

        $soma = 0;

        for ($i = $valor_inicial; $i <= $valor_final; $i++){

            $soma += $i;

        }

        $mediaAritmetica = $soma/($valor_final - $valor_inicial);

        echo "$mediaAritmetica";

    ?>
    
</body>
</html>