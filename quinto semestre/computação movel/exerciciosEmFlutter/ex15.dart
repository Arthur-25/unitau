import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio15',
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

  String _textoIndicandoSituacao = "O numero 1 é positivo";

  void _efetuarProcessamento() {

    int numero = int.parse(_numero.text);

    setState((){

        if (numero ==0){

          _textoIndicandoSituacao = "O numero $numero é zero";

        }

        else if (numero>0){

          _textoIndicandoSituacao = "O numero $numero é Positivo";

        }

        else{

          _textoIndicandoSituacao = "O numero $numero é negativo";

        }
      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 15")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '15) Desenvolver um programa que leia um número e indique se ele é positivo, negativo ou zero.',
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
                'Calcular media ponderada',
                style: TextStyle(color: Colors.purple),
              ),

            ),

            Text(
              '$_textoIndicandoSituacao',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
