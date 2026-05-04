import 'package:flutter/material.dart';

import 'model/Pessoa.dart';
import 'rotas/telas/tela2.dart';
import 'rotas/telas/tela3.dart';
import 'rotas/telas/tela4.dart';

void main() {
  runApp(const Rotas());
}

class Rotas extends StatelessWidget {
  const Rotas({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilizando rotas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MinhasRotas(title: 'Utilizando rotas'),
      routes: {
        '/tela1': (context) => const Tela1(),
        '/tela2': (context) => const Tela2(),
        '/tela3': (context) => const Tela3(),
        '/tela4': (context) =>
            Tela4.novaInstancia(parametro: "Valor passado via nova instância")
      },
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Tela 1', style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}

class MinhasRotas extends StatefulWidget {
  const MinhasRotas({super.key, required this.title});

  final String title;

  @override
  State<MinhasRotas> createState() => _MinhasRotasState();
}

class _MinhasRotasState extends State<MinhasRotas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tela1');
                },
                child: const Text('TELA 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tela2',
                      arguments: 'Passagem de parâmetro');
                },
                child: const Text('TELA 2')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tela3',
                      arguments: Pessoa("Silvio", "Santos"));
                },
                child: const Text('TELA 3')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tela4');
                },
                child: const Text('TELA 4')),
          ],
        ),
      ),
    );
  }
}
