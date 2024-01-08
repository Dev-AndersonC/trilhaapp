import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/home_page.dart';
import 'Pages/loguin_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.black, background: Colors.cyan),
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true),
      home: const LoguinPage(),
    );
  }
}
