import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Título',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final TextEditingController _valor1 = TextEditingController();
  final TextEditingController _valor2 = TextEditingController();

  int _resultado = 0;

  void _efetuarProcessamento() {
    int valor1 = int.parse(_valor1.text);
    int valor2 = int.parse(_valor2.text);
    setState(() {
      _resultado = valor1 + valor2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício")),
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
                '01) Desenvolver um programa que efetue a soma de dois números',
                style: TextStyle(fontSize: 24)),
            //Segundo elemento da lista
            TextField(
              controller: _valor1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o valor 1:',
              ),
            ),
            //Terceiro elemento da lista
            TextField(
              controller: _valor2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o valor 2:',
              ),
            ),
            //Quarto elemento da lista
            const SizedBox(height: 20),
            //Quinto elemento da lista
            ElevatedButton(
              onPressed: _efetuarProcessamento,
              child: const Text('Processar'),
            ),
            //Sexto elemento da lista
            const SizedBox(height: 20),
            Text(
              'A soma é $_resultado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
