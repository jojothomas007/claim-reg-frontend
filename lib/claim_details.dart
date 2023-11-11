import 'package:claim_reg_frontend/widgets/AppCard.dart';
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
      home: const MyHomePage(title: 'Claim Reg'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim Information'),
        centerTitle: true,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: AppCard(keyValuePair: {'dfsd': 'sdf', 'sdf': 'sdf'}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: AppCard(keyValuePair: {'dfsd': 'sdf', 'sdf': 'sdf'}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: AppCard(keyValuePair: {'dfsd': 'sdf', 'sdf': 'sdf'}),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
