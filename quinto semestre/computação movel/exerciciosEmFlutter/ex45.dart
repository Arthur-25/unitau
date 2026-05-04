import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  
    final TextEditingController _valorInicial = TextEditingController();

    final TextEditingController _valorFinal = TextEditingController();
    
    String _stringComNumeros = "Nenhuma ação";

  void _efetuarProcessamento() {

    int valorInicial = int.parse(_valorInicial.text);

    int valorFinal = int.parse(_valorFinal.text);

    if (valorInicial > valorFinal){

      _stringComNumeros = "Ação é invalida";

    }

    else{

      _stringComNumeros = "NÚMEROS PRIMOS em um intervalo definido pelo usuário: ";

      

      for (int i = valorInicial; i <= valorFinal; i++){

        int numerosDivisiveis = 0;

        for (int j = 1; j <= valorFinal; j++){

          if (i % j == 0){

            numerosDivisiveis++;   

          }

        }

        if (numerosDivisiveis<=2){

            _stringComNumeros += "$i, ";

          }

      }


    

    }

    
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
              '45) Faça um programa que exiba os NÚMEROS PRIMOS em um intervalo definido pelo usuário.',
              style: TextStyle(fontSize: 24),
            ),

            TextField(
              controller: _valorInicial,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o valor inicial',
              ),
            ),

            TextField(
              controller: _valorFinal,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o valor final',
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
              '$_stringComNumeros',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
