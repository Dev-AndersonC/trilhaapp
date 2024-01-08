import 'package:flutter/material.dart';

class LoguinPage extends StatefulWidget {
  const LoguinPage({super.key});

  @override
  State<LoguinPage> createState() => _LoguinPageState();
}

class _LoguinPageState extends State<LoguinPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.person,
                size: 150,
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Informe seu email"),
              ),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Informe a senha")),
              Expanded(child: Container()),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Botão")),
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Cadastro")),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
