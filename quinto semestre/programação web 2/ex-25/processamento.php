<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

        $valor1 = $_GET['valor1'];

        $valor2 = $_GET['valor2'];

        $valor3 = $_GET['valor3'];

        if ($valor1 < 0 || $valor1 > 3){

            echo "Valor 1 invalido";

        }

        else{

            $calculo;

            if ($valor1 == 0){

                $calculo = $valor2 + $valor3;

            }

            if ($valor1 == 1){

                $calculo = $valor2 - $valor3;

            }

            if ($valor1 == 2){

                $calculo = $valor2 * $valor3;

            }

            if ($valor1 == 3){

                $calculo = $valor2 / $valor3;

            }

            echo "$calculo";

        }

    ?>
    
</body>
</html>