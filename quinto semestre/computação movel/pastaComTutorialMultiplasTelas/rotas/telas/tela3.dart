import 'package:flutter/material.dart';
import 'package:projeto_modelo/model/Pessoa.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    final pessoa = ModalRoute.of(context)!.settings.arguments as Pessoa;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tela 3', style: TextStyle(fontSize: 50)),
            Text(pessoa.nome, style: const TextStyle(fontSize: 30)),
            Text(pessoa.sobrenome, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
