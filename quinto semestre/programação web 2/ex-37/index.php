<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

    $valor_inicial = 0;

    $valor_final = 100;

    $soma = 0;

    for ($i = $valor_inicial; $i <= $valor_final; $i++){

        $soma += $i;

    }

    echo "$soma";

    ?>
    
</body>
</html>