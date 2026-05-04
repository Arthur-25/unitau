import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio17',
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

    String _situacao = "Não tem numero";
  
  
  void _efetuarProcessamento() {

    

    int numero = int.parse(_numero.text);

    setState((){

      if (numero % 2 == 0){

        _situacao = "O numero $numero é par";

      }

      else{

        _situacao = "O numero $numero é impar";

      }

      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 17")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            const Text(
              '17) Desenvolver um programa que leia um número e mostre uma mensagem indicando se este número é par ou ímpar e se é positivo ou negativo.',
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
                'Calcular numero par/impar',
                style: TextStyle(color: Colors.purple),
              ),

            ),


            Text(
              '$_situacao',
              style: TextStyle(fontSize: 20),
            ),


          ],
        ),
      ),
    );
  }
}
