import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio18',
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

  String _numeroMaior = 'Não tem numero maior';
  
  void _efetuarProcessamento() {

      int numero1 = int.parse(_numero1.text);

      int numero2 = int.parse(_numero2.text);



    setState((){

      if (numero1 == numero2){

        _numeroMaior = "Os dois numeros são iguais";

      }

      else if (numero1 > numero2){

        _numeroMaior = '$numero1 é maior que $numero2';

      }

      else{

        _numeroMaior = '$numero2 é maior que $numero1';

      }

      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 18")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '18) Desenvolver um programa que leia dois números. Se os números forem iguais imprimir a mensagem: “Números iguais” e encerrar a execução; caso contrário, imprimir o de maior valor, acompanhando pela mensagem “é o maior”.',
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


            const SizedBox(height:24),

            ElevatedButton(
              onPressed: _efetuarProcessamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),

              child: const Text(
                'Calcular numero maior',
                style: TextStyle(color: Colors.purple),
              ),

            ),


            Text(
              '$_numeroMaior',
              style: TextStyle(fontSize: 20),
            ),



          ],
        ),
      ),
    );
  }
}
