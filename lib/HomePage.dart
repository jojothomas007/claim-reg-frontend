import 'dart:html';

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
        title: Text('Temporary Text'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Claim Registration made easy !',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  print('New Claim');
                },
                child: const Text('New Claim',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  print('My Claims');
                },
                child: const Text('My Claims',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  print('For Approvals');
                },
                child: const Text('For Approvals',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
