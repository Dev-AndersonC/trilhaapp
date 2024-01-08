import 'package:flutter/material.dart';
import 'package:trilhaapp/Pages/configuracao.dart';
import 'package:trilhaapp/Pages/dados_pessoais.dart';
import 'package:trilhaapp/Pages/termo_e_privacidade.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    child: const Text("Dados Pessoais"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DadosPessoaisPage(
                                    texto: "Meus Dados",
                                  )));
                    }),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: const Text("Termo de uso e privacidade"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermosPage()));
                    }),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: const Text("Configurações"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    }),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text(
            "Main Page",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 65, 27, 126),
        ),
        body: PageView(
          // scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.lightBlueAccent,
            ),
            Container(
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }
}
