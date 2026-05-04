import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio3',
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
  final TextEditingController _base = TextEditingController();

  final TextEditingController _altura = TextEditingController();
  
  int _areaRetangulo = 0;

  void _efetuarProcessamento() {

    int base = int.parse(_base.text);

    int altura = int.parse(_altura.text);
    
    setState(() {
      _areaRetangulo = base * altura;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 3")),
      ),
      body: Center(
        child: Column(
          //A propriedade mainAxisAlignment é usada para definir como os
          //widgets filhos de um Row ou Column são alinhados no eixo principal.
          //MainAxisAlignment.center: centraliza os widgets filhos no eixo principal.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //primeiro elemento
            const Text(

              '3) Desenvolver um programa que efetue o cálculo da área do retângulo.',

              style: TextStyle(fontSize: 24)


            ),
            //segundo elemento
            TextField(

              controller: _base,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Digite a base',
              ),

            ),
            //terceiro elemento
            TextField(

              controller: _altura,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(

                  labelText: 'Digite a altura',

              ),

            ),

            const SizedBox(height: 20,),
            //quarto elemento
            ElevatedButton(

              onPressed: _efetuarProcessamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow
              ),
              child: const Text ('calcular',
                style: TextStyle( color: Colors.purple,
                ), 
              ),
            ),
            
            const SizedBox(height: 20),
            //quinto elemento
            Text(

              'A area do retangulo é: $_areaRetangulo',
              style: const TextStyle(fontSize: 24),

            ),

          ],
        ),
      ),
    );
  }
}
