import 'dart:html';

import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDatebox.dart';
import 'package:claim_reg_frontend/widgets/AppTextbox.dart';
import 'package:flutter/material.dart';

class ClaimItemForm extends StatefulWidget {
  const ClaimItemForm({Key? key}) : super(key: key);

  @override
  State<ClaimItemForm> createState() => _ClaimItemFormState();
}

class _ClaimItemFormState extends State<ClaimItemForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Item'),
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
                  label: 'Bill Number',
                ),
                AppDatebox(
                  label: 'Bill Date',
                ),
                AppTextbox(
                  label: 'Expense Code',
                ),
                AppTextbox(
                  label: 'Cost Center',
                ),
                AppTextbox(
                  label: 'Amount',
                ),
                AppDatebox(
                  label: 'Subscription Start Date',
                ),
                AppDatebox(
                  label: 'Subscription End Date',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(text: 'Ok'),
                      AppButton(text: 'Cancel'),
                    ],
                  ),
                ),
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
