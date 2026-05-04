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
        
        if ($valor1 == $valor2){

            echo "Numeros iguais";

        }

        else{

            $maior = 0;

            if ($valor1 > $valor2){

                $maior = $valor1;

            }

            else{

                $maior = $valor2;

            }

            echo "$maior é o maior";
            
        }
    ?>

</body>

</html>

