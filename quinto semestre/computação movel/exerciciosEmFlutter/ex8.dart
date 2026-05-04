import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio8',
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
  
  final TextEditingController _numero = TextEditingController();

  double _numeroAtual = 100;

  double _porcentagem25DoAtual = 25;

  double _porcentagem50DoAtual = 50;

  double _porcentagem100DoAtual = 100;

  double _porcentagem150DoAtual = 150;

  void _efetuarProcessamento() {

    double numeroAtual = double.parse(_numero.text);

    setState((){
        _numeroAtual = numeroAtual;

        _porcentagem25DoAtual = (numeroAtual*25)/100;

        _porcentagem50DoAtual = (numeroAtual*50)/100;

        _porcentagem100DoAtual = (numeroAtual*100)/100;
        
        _porcentagem150DoAtual = (numeroAtual*150)/100;
      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 8")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '08) Desenvolver um programa que solicite um valor numérico e informe 25%, 50%, 100% e 150% do valor de entrada.',
              style: TextStyle(fontSize: 24),
            ),

            TextField(
              controller: _numero,
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
              'O numero atual é: |$_numeroAtual|, 25%: |$_porcentagem25DoAtual|, 50%: |$_porcentagem50DoAtual|, 100%: |$_porcentagem100DoAtual|, 150%: |$_porcentagem150DoAtual|',
            ),

          ],
        ),
      ),
    );
  }
}
