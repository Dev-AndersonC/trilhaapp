import 'package:flutter/material.dart';
import 'package:trilhaapp/repository/linguagens_repository.dart';
import 'package:trilhaapp/repository/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/TextLabel.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({super.key});

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController DataNascimentoController =
      TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagemRepository = LinguagensRepository();

  var niveis = [];
  var nivelSelecionado = "";
  var linguagens = [];
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLiguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 211, 238),
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: ListView(
            children: [
              const TextLabel(texto: "Nome"),
              TextField(
                controller: nameController,
              ),
              const TextLabel(texto: "Data de nascimento"),
              TextField(
                controller: DataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var datanascimento = await showDatePicker(
                      //criar um calendariio
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2006, 1, 1));
                  if (datanascimento != null) {
                    DataNascimentoController.text = datanascimento.toString();
                    dataNascimento = datanascimento;
                  }
                },
              ),
              const TextLabel(texto: "Nivel de experiencia"),
              Column(
                  children: niveis
                      .map((nivel) => RadioListTile(
                          title: Text(nivel.toString()),
                          selected: nivelSelecionado == nivel,
                          value: nivel,
                          groupValue: nivelSelecionado,
                          onChanged: (value) {
                            setState(() {
                              nivelSelecionado = value.toString();
                            });
                          }))
                      .toList()),
              const TextLabel(texto: "Linguagens preferidas"),
              Column(
                  children: linguagens
                      .map((e) => CheckboxListTile(
                          title: Text(e),
                          value: linguagensSelecionadas.contains(e),
                          onChanged: (bool? value) {
                            if (value == true) {
                              setState(() {
                                linguagensSelecionadas.add(e);
                              });
                            } else {
                              setState(() {
                                linguagensSelecionadas.remove(e);
                              });
                            }
                          }))
                      .toList()),
              TextLabel(texto: "Tempo de experiencia"),
              TextLabel(
                  texto:
                      "Pretenção salarial. R\$ ${salarioEscolhido.round().toString()}"), //iremos aprender slider
              Slider(
                  min: 0,
                  max: 30000,
                  value: salarioEscolhido,
                  onChanged: (double value) {
                    setState(() {
                      salarioEscolhido = value;
                    });
                  }),
              TextButton(onPressed: () {}, child: const Text("Salvar"))
            ],
          ),
        ));
  }
}
