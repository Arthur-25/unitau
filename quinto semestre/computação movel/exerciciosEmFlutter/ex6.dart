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
  
  final TextEditingController _numero = TextEditingController();

  int _numeroPosterior = 1;

  int _numeroAtual = 0;
  
  void _efetuarProcessamento() {

  int numero = int.parse(_numero.text);
    

    setState((){
      _numeroAtual = numero;

      _numeroPosterior = numero + 1;
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
              '06) Desenvolver um programa que solicite um valor numérico e informe o posterior dele.',
              style: TextStyle(fontSize:24),
            ),

            TextField(
              controller: _numero,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um numero',
              ),
            ),

            const SizedBox(height: 24,),

            ElevatedButton(
              onPressed: _efetuarProcessamento,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
              ),
              child: const Text ('Calcular',
                style: TextStyle(color: Colors.purple,),
              ),
            ),

            const SizedBox(height:24,),

            Text(

              'Numero posterior a $_numeroAtual é: $_numeroPosterior',
              style: const TextStyle(fontSize:24),

            ),

          ],
        ),
      ),
    );
  }
}
