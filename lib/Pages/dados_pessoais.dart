import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatelessWidget {
  const DadosPessoaisPage({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: Center(child: Text("Dados Pessoais")),
    );
  }
}
