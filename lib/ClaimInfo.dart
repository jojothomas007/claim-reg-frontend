import 'dart:html';

import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDropdown.dart';
import 'package:claim_reg_frontend/widgets/AppTextbox.dart';
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
        title: Text('Claim Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextbox(
                  label: 'Claim Id',
                ),
                AppDropdown(
                    label: 'Claim Type',
                    itemList: ['item 1', 'item 2', 'item 3', 'item 4']),
                AppDropdown(label: 'Claimant', itemList: [
                  'Jojo Thomas',
                ]),
                AppTextbox(
                  label: 'Status',
                ),
                AppDropdown(label: 'Currency', itemList: ['INR']),
                AppDropdown(label: 'Approver', itemList: [
                  'Biju Abraham',
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    'claim details',
                    style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                    // textAlign: TextAlign.center,
                  ),
                ),
                AppButton(text: 'Submit'),
              ],
            ),
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
