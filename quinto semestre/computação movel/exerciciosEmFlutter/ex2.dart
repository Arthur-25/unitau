import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio2',
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
  final TextEditingController _lado = TextEditingController();
  

  int _areaQuadrado = 0;

  void _efetuarProcessamento() {
    int lado = int.parse(_lado.text);
    

    
    setState(() {
      _areaQuadrado = lado*lado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 2")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Primeiro elemento da lista
            const Text(
                '02) Desenvolver um programa que efetue o cálculo da área do quadrado.',
                style: TextStyle(fontSize: 24)),
            //Segundo elemento da lista
            TextField(
              controller: _lado,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o valor do lado do quadrado:',
              ),
            ),
            //Terceiro elemento da lista

            const SizedBox(height: 20),
            //Quarto elemento da lista
            ElevatedButton(
              onPressed: _efetuarProcessamento,
              child: const Text('Processar',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            //Quinto elemento da lista
            const SizedBox(height: 20),
            Text(
              'A area do quadrado é $_areaQuadrado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
