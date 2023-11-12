import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDatebox.dart';
import 'package:claim_reg_frontend/widgets/AppTextbox.dart';
import 'package:flutter/material.dart';

import '../widgets/BaseAppBar.dart';

class ClaimItemPage extends StatefulWidget {
  const ClaimItemPage({Key? key}) : super(key: key);

  @override
  State<ClaimItemPage> createState() => _ClaimItemPageState();
}

class _ClaimItemPageState extends State<ClaimItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Claim Items',
        appBar: AppBar(),
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
                      AppButton(
                          text: 'Ok',
                          onPressed: () {
                            throw Exception('Incomplete Implementation');
                          }),
                      AppButton(
                          text: 'Cancel',
                          onPressed: () {
                            throw Exception('Incomplete Implementation');
                          }),
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
