<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

        $valor_inicial = -333;

        $valor_final = 333;

        $somatoria = 0;

        for ($i = $valor_inicial; $i <= $valor_final; $i++){

            if ($i % 3 == 0){

                $somatoria += $i;

            }

        }

        echo "$somatoria";

    ?>

    
</body>
</html>