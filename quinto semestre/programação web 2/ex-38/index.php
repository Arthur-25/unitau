<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <?php

    $valor_inicial = 255;

    $valor_final = 555;

    $multiplicacao = 1;

    for ($i = $valor_inicial; $i <= $valor_final; $i++){

        $multiplicacao *= $i;

    }

    echo "$multiplicacao";

    ?>


</body>
</html>