import 'package:flutter/material.dart';

class LoguinPage extends StatefulWidget {
  const LoguinPage({super.key});

  @override
  State<LoguinPage> createState() => _LoguinPageState();
}

//https://hermes.digitalinnovation.one/assets/diome/logo.png
class _LoguinPageState extends State<LoguinPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(223, 29, 27, 27),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                  ),
                  Expanded(child: Container())
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Já tem cadastro?",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Faça seu loguin e make the change_",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "Informe seu email",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Informe a senha",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 160, 81, 224))),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        )),
                  )),
              const SizedBox(height: 20),
              Expanded(child: Container()),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.yellowAccent),
                  )),
              const SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
