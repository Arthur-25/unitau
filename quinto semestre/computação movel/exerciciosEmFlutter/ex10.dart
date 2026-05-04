import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio10',
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

  double _mediaAritmetica = 1;
  
  void _efetuarProcessamento() {

    double nota1 = (double.parse(_nota1.text) * 30)/100;

    double nota2 = (double.parse(_nota2.text) * 30)/100;

    double nota3 = (double.parse(_nota3.text) * 30)/100;

    double nota4 = (double.parse(_nota4.text) * 70)/100;

    setState((){
        _mediaAritmetica = (nota1 + nota2 + nota3 + nota4)/1.5;
      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 10")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '10) Desenvolver um programa que efetue o cálculo da média ponderada de 4 notas de entrada. Sendo as nota1, nota2 e nota3 equivalendo a 30% da nota total e a nota4 equivalendo a 70% de peso.',
              style: TextStyle(fontSize:24),
            ),

            TextField(
              controller: _nota1,
              keyboardType:TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 1',
              ),
            ),


            TextField(
              controller: _nota2,
              keyboardType:TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 2',
              ),
            ),

            TextField(
              controller: _nota3,
              keyboardType:TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a nota 3',
              ),
            ),

            TextField(
              controller: _nota4,
              keyboardType:TextInputType.number,
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
                'Calcular media ponderada',
                style: TextStyle(color: Colors.purple),
              ),

            ),

             Text(
              "A media ponderada é:$_mediaAritmetica",
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
