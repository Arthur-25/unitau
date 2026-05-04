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

        $pares = 0;

        $impares = 0;

        for ($i = $valor_inicial; $i <= $valor_final; $i++){

            if ($i % 2 == 0){

                $pares++;

            }

            else{

                $impares++;

            }

        }

        echo "Pares: $pares<br/>";

        echo "Impares: $impares";

    ?>
    
</body>
</html>