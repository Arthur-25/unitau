import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      ModalRoute.of(context)!.settings.arguments é usada para obter os argumentos
      passados para uma rota modal (modal route) específica.

      A expressão ModalRoute.of(context) retorna a rota modal atual associada ao contexto fornecido. 
      O operador de navegação !. é usado para indicar que a rota modal é 
      garantida para existir e, assim, força o acesso direto a suas configurações 
      (settings) sem a necessidade de verificações de nulidade (null checks).

      .settings.arguments é uma propriedade das configurações de uma rota, 
      ela permite passar argumentos de uma rota para outra. 
    */
    final parametros = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tela 2', style: TextStyle(fontSize: 50)),
            Text(parametros.toString(), style: const TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
