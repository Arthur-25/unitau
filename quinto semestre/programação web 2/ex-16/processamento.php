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

        //Processando o resultado
        
        if ($valor1 > $valor2){

            echo 'Valor1 maior que valor2';

        }

        else {

            echo 'Valor2 maior que valor1';

        }
        
    ?>

</body>

</html>

