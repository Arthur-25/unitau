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
  
    String _stringComNumeros = "somatória dos ímpares e divisíveis por 5 de todos os números de -200 até 200: ";

  void _efetuarProcessamento() {

    double resultado = 0;

    for (int i = -200; i <= 200; i++){
      
      if (i % 2 != 0 && i % 5 == 0){

        resultado += i;

      }
      

    }

    _stringComNumeros += "$resultado";

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
              '42) Imprima a somatória dos ímpares e divisíveis por 5 de todos os números de -200 até 200.',
              style: TextStyle(fontSize: 24),
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
              '$_stringComNumeros',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
