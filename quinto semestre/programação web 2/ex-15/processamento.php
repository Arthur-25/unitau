

<!DOCTYPE html>
<html>

<head>
    <title>Exercício 15</title>
</head>

<body>

    <?php
    
        //Recebendo os valores via GET
        $valor1 = $_GET['valor1'];

        //Processando o resultado
        
        if ($valor1 > 0){

            echo "O numero $valor1 é positivo";

        }

        else if ($valor1 == 0){

            echo "O numero é zero";

        }

        else{

            echo "O numero $valor1 é negativo";

        }
        
        
    ?>

</body>

</html>

