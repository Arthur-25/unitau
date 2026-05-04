import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio5',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SomaNumeros(),
    );
  }
}

class SomaNumeros extends StatefulWidget {
  const SomaNumeros({super.key});

  


  @override
  SomaNumerosState createState() => SomaNumerosState();
}

class SomaNumerosState extends State<SomaNumeros> {
  
  final TextEditingController _nota1 = TextEditingController();

  final TextEditingController _nota2 = TextEditingController();

  final TextEditingController _nota3 = TextEditingController();

  final TextEditingController _nota4 = TextEditingController();

  String _situacaoAluno = "Não foi aprovado, nem reprovado";

  void _efetuarProcessamento() {

    double nota1 = double.parse(_nota1.text);

    double nota2 = double.parse(_nota2.text);

    double nota3 = double.parse(_nota3.text);

    double nota4 = double.parse(_nota4.text);

    double media = (nota1 + nota2 + nota3 + nota4)/4;

    bool valido = true;

    if (nota1<0 || nota1>10) valido = false;

    if (nota2<0 || nota2>10) valido = false;

    if (nota3<0 || nota3>10) valido = false;

    if (nota4<0 || nota4>10) valido = false;

    if (valido){

      if (media >= 6){

          setState((){

            _situacaoAluno = "Aprovado";

          }
        );    

      }

      else{

        setState((){

                    _situacaoAluno = "Reprovado";

                  }
                );

      }

    } // fim do if que verifica se os numeros são validos

    else{

      setState((){

            _situacaoAluno = "Alguma nota é invalida (menor que 0, maior que 10)";

          }
        );
      
    }

    

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 6")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '20) Desenvolver um programa que efetue o cálculo da média aritmética de 4 notas de entrada. Se a média aritmética for maior ou igual que 6, escreva "Aprovado". Senão, escrever "Reprovado".',
              style: TextStyle(fontSize: 24),
            ),

            const Text(
              '20.1) Desafio: Se qualquer um dos valores de entrada for menor que zero ou maior que 10, o programa deverá apresentar uma mensagem indicando que a nota é inválida e o programa deverá ser encerrado.',
              style: TextStyle(fontSize: 24),
            ),

            TextField(
              controller: _nota1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 1',
              ),
            ),

            TextField(
              controller: _nota2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 2',
              ),
            ),

            TextField(
              controller: _nota3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 3',
              ),
            ),

            TextField(
              controller: _nota4,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 4',
              ),
            ),

            const SizedBox(height:24),

            ElevatedButton(
              onPressed: _efetuarProcessamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),

              child: const Text(
                'Calcular',
                style: TextStyle(color: Colors.purple),
              ),

            ),

            Text(
              '$_situacaoAluno',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
