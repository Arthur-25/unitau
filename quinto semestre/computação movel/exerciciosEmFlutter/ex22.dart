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

    int _menorNumero = 0;

  void _efetuarProcessamento() {

    int numero1 = int.parse(_numero1.text);

    int numero2 = int.parse(_numero2.text);

    int numero3 = int.parse(_numero3.text);



    setState((){

      //Numero 1

      if (numero1 < numero2 && numero1 < numero3){

        _menorNumero = numero1;

      }

      //Numero 2

      if (numero2 < numero1 && numero2 < numero3){

        _menorNumero = numero2;

      }

      //Numero 3

      if (numero3 < numero1 && numero3 < numero2){

        _menorNumero = numero3;

      }

      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 22")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '22) Desenvolver um programa que leia 3 números e indique qual é o menor.',
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
              '$_menorNumero',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
