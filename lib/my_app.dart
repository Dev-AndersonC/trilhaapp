import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/Pages/dados_pessoais.dart';
import 'Pages/main_page.dart';
import 'Pages/loguin_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true),
      // home: const LoguinPage(), //Alterado apenas para facilitar vizialização
      home: const DadosPessoaisPage(),
    );
  }
}
