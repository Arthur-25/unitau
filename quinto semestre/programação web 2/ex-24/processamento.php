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

        $valor4 = $_GET['valor4'];

        //valor 1 

        echo "$valor1";

        if ($valor1 == 0){

            echo " é zero";

        }

        if ($valor1 > -1){

            echo " é positivo";

        }

        else{

            echo " é negativo";

        }

        if ($valor1 % 4 == 0){

            echo " é divisivel por 4";

        }

        echo "<br/>";

        //valor 2


        echo "$valor2";

        if ($valor2 == 0){

            echo " é zero";

        }

        if ($valor2 > -1){

            echo " é positivo";

        }

        else{

            echo " é negativo";

        }

        if ($valor2 % 4 == 0){

            echo " é divisivel por 4";

        }

        echo "<br/>";

        //valor 3


        echo "$valor3";

        if ($valor3 == 0){

            echo " é zero";

        }

        if ($valor3 > -1){

            echo " é positivo";

        }

        else{

            echo " é negativo";

        }

        if ($valor3 % 4 == 0){

            echo " é divisivel por 4";

        }

        echo "<br/>";

        //valor 4


        echo "$valor4";

        if ($valor4 == 0){

            echo " é zero";

        }

        if ($valor4 > -1){

            echo " é positivo";

        }

        else{

            echo " é negativo";

        }

        if ($valor4 % 4 == 0){

            echo " é divisivel por 4";

        }


    ?>
    
</body>
</html>