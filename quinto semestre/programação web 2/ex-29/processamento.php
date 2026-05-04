<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php 

    $valorInicial = $_GET['valor1'];

    $valorFinal = $_GET['valor2'];

    echo "Numeros pares <br/>";

    for ($i = $valorInicial; $i <= $valorFinal; $i++){

        if ($i % 2 == 0){

            echo "$i <br/>";

        }

    }

    echo "Numeros impares <br/>";

    for ($i = $valorInicial; $i <= $valorFinal; $i++){

        if ($i % 2 != 0){

            echo "$i <br/>";

        }

    }

    ?>
    
</body>
</html>