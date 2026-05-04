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

        $maior = $valor1;

        if ($valor2 > $maior) {

            $maior = $valor2;

        }

        if ($valor3 > $maior){

            $maior = $valor3;

        }

        echo "$maior";

    ?>

    
</body>
</html>