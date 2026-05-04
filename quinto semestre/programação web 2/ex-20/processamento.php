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

        $valor4 = $_GET['valor4'];

        //Processando o resultado

        $media = ($valor1 + $valor2 + $valor3 + $valor4)/4;

        $valido = true;

        if ($valor1 < 0 || $valor1 > 10){
            $valido = false;
        }

        else if ($valor2 < 0 || $valor2 > 10){
            $valido = false;
        }

        else if ($valor3 < 0 || $valor3 > 10){
            $valido = false;
        }

        else if ($valor4 < 0 || $valor4 > 10){
            $valido = false;
        }

        else if ($valido) {

            if ($media >= 6){

                echo "Aprovado";

            }

            else{

                echo "Reprovado";

            }

        }


        
    ?>

</body>

</html>

