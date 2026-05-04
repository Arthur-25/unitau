import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tela4 extends StatelessWidget {
  String parametro = "";

  Tela4.novaInstancia({super.key, this.parametro = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tela 4', style: TextStyle(fontSize: 50)),
            Text(parametro, style: const TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
