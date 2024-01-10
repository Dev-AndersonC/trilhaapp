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
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLiguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    return itens;
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
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
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
                          DataNascimentoController.text =
                              datanascimento.toString();
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
                    const TextLabel(texto: "Tempo de experiencia"),
                    DropdownButton(
                        value: tempoExperiencia,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        }),
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
                    TextButton(
                        onPressed: () {
                          setState(() {
                            salvando = false;
                          });
                          if (nameController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Nome deve ser preenchido")));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Data de nascimento invalida!")));
                            return;
                          }
                          if (nivelSelecionado.trim() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nivel deve ser selecionado")));
                            return;
                          }
                          if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ser selecionado ao menos uma linguagen")));
                            return;
                          }
                          if (salarioEscolhido == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A prentenção salarial deve ser maior que zero")));
                            return;
                          }
                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Dados salvo")));
                              salvando = false;
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Salvar"))
                  ],
                ),
        ));
  }
}
