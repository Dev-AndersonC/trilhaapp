import 'package:flutter/material.dart';

class LoguinPage extends StatefulWidget {
  const LoguinPage({super.key});

  @override
  State<LoguinPage> createState() => _LoguinPageState();
}

//https://hermes.digitalinnovation.one/assets/diome/logo.png
class _LoguinPageState extends State<LoguinPage> {
  String email = "";
  String password = "";
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(223, 29, 27, 27),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: -1),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 160, 81, 224))),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 160, 81, 224),
                          )),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: isObscureText,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 0),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 160, 81, 224))),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color.fromARGB(255, 160, 81, 224)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: Color.fromARGB(255, 160, 81, 224),
                              ),
                            )),
                      )),
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
        ),
      ),
    );
  }
}
