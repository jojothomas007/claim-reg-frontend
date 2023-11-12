import 'package:claim_reg_frontend/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Claim Reg',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
