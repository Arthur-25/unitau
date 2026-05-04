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

  String _caracteristicasNumero1 = "Nenhum dado";

  final TextEditingController _numero2 = TextEditingController();

  String _caracteristicasNumero2 = "Nenhum dado";

  final TextEditingController _numero3 = TextEditingController();

  String _caracteristicasNumero3 = "Nenhum dado";

  final TextEditingController _numero4 = TextEditingController();

  String _caracteristicasNumero4 = "Nenhum dado";

  void _efetuarProcessamento() {

    int numero1 = int.parse(_numero1.text);

    int numero2 = int.parse(_numero2.text);

    int numero3 = int.parse(_numero3.text);

    int numero4 = int.parse(_numero4.text);

    setState((){

      //numero 1

      //If para descobrir se é 0

      if (numero1 == 0){

        _caracteristicasNumero1 = "O primeiro numero é 0, ";

      }

      else{

        _caracteristicasNumero1 = "O primeiro numero não é 0, ";

      }

      //If para descobrir se negativo ou positivo

      if (numero1 > 0){

        _caracteristicasNumero1 += "ele é positivo, ";

      }

      if (numero1 < 0){

        _caracteristicasNumero1 += "ele é negativo, ";

      }

      //If para descobrir se o numero é divisivel por 4

      if (numero1 % 4 == 0){

        _caracteristicasNumero1 += "é divisivel por 4.";

      }

      else{

        _caracteristicasNumero1 += "não é divisivel por 4.";

      }

      //numero 2

      //If para descobrir se é 0

      if (numero2 == 0){

        _caracteristicasNumero2 = "O segundo numero é 0, ";

      }

      else{

        _caracteristicasNumero2 = "O segundo numero não é 0, ";

      }

      //If para descobrir se negativo ou positivo

      if (numero2 > 0){

        _caracteristicasNumero2 += "ele é positivo, ";

      }

      if (numero2 < 0){

        _caracteristicasNumero2 += "ele é negativo, ";

      }

      //If para descobrir se o numero é divisivel por 4

      if (numero2 % 4 == 0){

        _caracteristicasNumero2 += "é divisivel por 4.";

      }

      else{

        _caracteristicasNumero2 += "não é divisivel por 4.";

      }

      //numero 3

      //If para descobrir se é 0

      if (numero3 == 0){

        _caracteristicasNumero3 = "O terceiro numero é 0, ";

      }

      else{

        _caracteristicasNumero3 = "O terceiro numero não é 0, ";

      }

      //If para descobrir se negativo ou positivo

      if (numero3 > 0){

        _caracteristicasNumero3 += "ele é positivo, ";

      }

      if (numero3 < 0){

        _caracteristicasNumero3 += "ele é negativo, ";

      }

      //If para descobrir se o numero é divisivel por 4

      if (numero3 % 4 == 0){

        _caracteristicasNumero3 += "é divisivel por 4.";

      }

      else{

        _caracteristicasNumero3 += "não é divisivel por 4.";

      }

      //numero 4

      //If para descobrir se é 0

      if (numero4 == 0){

        _caracteristicasNumero4 = "O quarto numero é 0, ";

      }

      else{

        _caracteristicasNumero4 = "O quarto numero não é 0, ";

      }

      //If para descobrir se negativo ou positivo

      if (numero4 > 0){

        _caracteristicasNumero4 += "ele é positivo, ";

      }

      if (numero4 < 0){

        _caracteristicasNumero4 += "ele é negativo, ";

      }

      //If para descobrir se o numero é divisivel por 4

      if (numero4 % 4 == 0){

        _caracteristicasNumero4 += "é divisivel por 4.";

      }

      else{

        _caracteristicasNumero4 += "não é divisivel por 4.";

      }

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
              '24) Desenvolver um programa que leia 4 números e indique as seguintes informações para cada número: Se ele é zero, positivo ou negativo; e se eles são divisíveis por 4.',
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

            TextField(
              controller: _numero4,
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
              '$_caracteristicasNumero1',
              style: TextStyle(fontSize: 20),
            ),

            Text(
              '$_caracteristicasNumero2',
              style: TextStyle(fontSize: 20),
            ),

            Text(
              '$_caracteristicasNumero3',
              style: TextStyle(fontSize: 20),
            ),

            Text(
              '$_caracteristicasNumero4',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
