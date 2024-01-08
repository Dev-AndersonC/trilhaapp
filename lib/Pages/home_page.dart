import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/services/gerador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 160, 191, 245),
          title: const Text(
            "My App",
            style: TextStyle(color: Color.fromARGB(255, 52, 57, 61)),
            /*style: GoogleFonts.pacifico()*/
          )),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 2, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Ações do usuario",
              style: GoogleFonts.aclonica(),
            )),
            Center(child: Text("Foi clicado $quantidadeCliques, vezes")),
            Center(
                child: Text("O numero gerado foi:$numeroGerado",
                    style: GoogleFonts.acme())),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline_sharp),
        onPressed: () {
          setState(() {
            quantidadeCliques++;
            numeroGerado = GeradorNumeroAleatorioService.gerarNumero(100);
          });
        },
      ),
    );
  }
}
