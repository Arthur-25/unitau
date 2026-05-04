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

        if ($valor_inicial > $valor_final){

            echo "Valor inicial maior que valor final ($valor_inicial > $valor_final) ação invalida";

        }

        else{

            for ($i = $valor_inicial; $i <= $valor_final; $i++){

                echo "$i <br/>";

            }

        }

    ?>


    
</body>
</html>