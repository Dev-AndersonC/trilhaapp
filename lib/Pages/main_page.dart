import 'package:flutter/material.dart';
import 'package:trilhaapp/Pages/Subpages/page_one.dart';
import 'package:trilhaapp/Pages/Subpages/page_three.dart';
import 'package:trilhaapp/Pages/Subpages/page_two.dart';
import 'package:trilhaapp/Pages/configuracao.dart';
import 'package:trilhaapp/Pages/dados_pessoais.dart';
import 'package:trilhaapp/Pages/termo_e_privacidade.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

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
                              builder: (context) => const DadosPessoaisPage()));
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
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                // scrollDirection: Axis.vertical,
                children: const [PageOne(), PageTwo(), PageThree()],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "page2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "page3", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
