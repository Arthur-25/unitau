import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio19',
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

  String _textoComNumeros = 'Não tem numero';
  
  void _efetuarProcessamento() {

      int numero1 = int.parse(_numero1.text);

      int numero2 = int.parse(_numero2.text);

      int numero3 = int.parse(_numero3.text);



    setState((){
      //Primeiro Numero

      _textoComNumeros = "Primeiro numero:";

      if (numero1 >= 0){
        int dobroNumero1 = numero1 * 2;

        _textoComNumeros += "$dobroNumero1";

      }

      else{

        int triploNumero1 = numero1 * 3;

        _textoComNumeros += "$triploNumero1";

      }

      //Segundo numero

      _textoComNumeros += "; Segundo numero:";

      if (numero2 > 10 && numero2 < 100){

        _textoComNumeros += "Intervalo permitido";

      }

      //terceiro numero

      _textoComNumeros += "; Terceiro numero";

      if (numero3 < numero2){

        int diferencaNumero3E2 = numero3 - numero2;

        _textoComNumeros += "$diferencaNumero3E2";

      }

      else{

        int terceiroNumeroAdicionado = numero3 + 1;

        _textoComNumeros += "$terceiroNumeroAdicionado";

      }

      }
    );

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 19")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              '19) Desenvolver um programa que leia três números. Se o primeiro for positivo, imprimir o seu dobro, caso contrário, imprimir o seu triplo; se o segundo número for maior que 10 e menor que 100, imprimir a mensagem: “Intervalo permitido”; se o terceiro número for menor que o segundo, calcular e imprimir a diferença entre eles (número 3 menos número 2), caso contrário, imprimir o terceiro número adicionado de 1.',
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
              '$_textoComNumeros',
              style: TextStyle(fontSize: 20),
            ),



          ],
        ),
      ),
    );
  }
}
