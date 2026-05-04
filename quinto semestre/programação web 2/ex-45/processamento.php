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

        for ($i = $valor_inicial; $i <= $valor_final; $i++){

            $primo = true;

            $divisiveis = 0;

            for ($j = 1; $j <= $i; $j++){

                if ($i % $j == 0){

                    $divisiveis++;

                }

                if ($divisiveis > 2){

                    $primo = false;

                    break;

                }

            }

            if ($primo){

                echo"$i é um numero primo<br/>";

            }

        }

    ?>
    
</body>
</html>