<!DOCTYPE html>
<html>

<head>
    <title>Exercício 16</title>
</head>

<body>

    <?php
    
        //Recebendo os valores via GET
        $valor1 = $_GET['valor1'];

        //Processando o resultado
        
        if ($valor1 % 2 == 0){

            echo "Numero par";

        }

        else{

            echo "Numero impar";

        }
        echo '<br/>';
        if ($valor1 > 0){

            echo "Numero positivo";

        }

        else{

            echo "Numero negativo";

        }
        
    ?>

</body>

</html>

