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
  
  final TextEditingController _numero1 = TextEditingController();

  final TextEditingController _numero2 = TextEditingController();

  final TextEditingController _numero3 = TextEditingController();

  String _mensagemOperacao = "Não há operação";
  
  void _efetuarProcessamento() {

    int numero1 = int.parse(_numero1.text);

    double numero2 = double.parse(_numero2.text);

    double numero3 = double.parse(_numero3.text);

    if (numero1 < 0 || numero1 > 3){

      _mensagemOperacao = "Operação invalida";
      

    }

    if (numero1 == 0){

      double soma = numero2 + numero3;

      _mensagemOperacao = "$numero2 + $numero3 = $soma";

    }

    if (numero1 == 1){

      double subtracao = numero2 - numero3;

      _mensagemOperacao = "$numero2 - $numero3 = $subtracao";

    }

    if (numero1 == 2){

      double multiplicacao = numero2 * numero3;

      _mensagemOperacao = "$numero2 * $numero3 = $multiplicacao";

    }

    if (numero1 == 3){

      double divisao = numero2 / numero3;

      _mensagemOperacao = "$numero2 / $numero3 = $divisao";

    }

    setState((){

      }
    );

   
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
              '25) Desenvolver um programa que solicite 3 valores para o usuário. O primeiro valor vai indicar qual operação matemática será efetuada (0: Soma; 1: Subtração; 2: Multiplicação; 3: Divisão). Os demais valores deverão sofrer a operação selecionada. Se for escolhida uma operação inválida (fora da faixa entre 0 e 3), deverá retornar a mensagem "Operação inválida".',
              style: TextStyle(fontSize: 24),
            ),

            TextField(
              controller: _numero1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um numero',
              ),
            ),

            TextField(
              controller: _numero2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um numero',
              ),
            ),

            TextField(
              controller: _numero3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um numero',
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
              '$_mensagemOperacao',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
