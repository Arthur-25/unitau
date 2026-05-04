<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

        $valor_inicial = -200;

        $valor_final = 200;

        $somatoria = 0;

        for ($i = $valor_inicial; $i <= $valor_final; $i++){

            if ($i % 5 == 0){

                $somatoria += $i;

            }

        }

        echo "$somatoria";

    ?>

    
</body>
</html>