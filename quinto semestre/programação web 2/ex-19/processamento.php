<!DOCTYPE html>
<html>

<head>
    <title>Exercício 16</title>
</head>

<body>

    <?php
    
        //Recebendo os valores via GET
        $valor1 = $_GET['valor1'];

        $valor2 = $_GET['valor2'];

        $valor3 = $_GET['valor3'];

        //Processando o resultado

        //Numero 1

        if ($valor1 > -1){

            echo $valor1*2;

        }

        else{

            echo $valor1*3;

        }

        //Numero 2

        echo "<br/>";

        if ($valor2 > 10 && $valor2 < 100){

            echo "Intervalo permitido";

        }

        //Numero 3

        echo "<br/>";

        if ($valor3 < $valor2){

            echo $valor3 - $valor2;

        }

        else{

            echo $valor3 + 1;

        }
        
    ?>

</body>

</html>

