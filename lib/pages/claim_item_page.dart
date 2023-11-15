import 'dart:developer';

import 'package:claim_reg_frontend/pages/create_claim_page.dart';
import 'package:claim_reg_frontend/pages/home_page.dart';
import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDatebox.dart';
import 'package:claim_reg_frontend/widgets/AppTextbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/Validators.dart';
import '../widgets/BaseAppBar.dart';

class ClaimItemPage extends StatefulWidget {
  const ClaimItemPage({Key? key}) : super(key: key);

  @override
  State<ClaimItemPage> createState() => _ClaimItemPageState();
}

class _ClaimItemPageState extends State<ClaimItemPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController billNumberController = TextEditingController();
  TextEditingController billDateController = TextEditingController();
  TextEditingController expenseCodeController = TextEditingController();
  TextEditingController costCenterController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController subStartController = TextEditingController();
  TextEditingController subEndController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Claim Items',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextbox(
                  label: 'Bill Number',
                  validator: Validators().checkFieldEmpty,
                  controller: billNumberController,
                ),
                AppDatebox(
                  label: 'Bill Date',
                  validator: Validators().checkFieldEmpty,
                  controller: billDateController,
                ),
                AppTextbox(
                  label: 'Expense Code',
                  validator: Validators().checkFieldEmpty,
                  controller: expenseCodeController,
                ),
                AppTextbox(
                  label: 'Cost Center',
                  validator: Validators().checkFieldEmpty,
                  controller: costCenterController,
                ),
                // getAmountField('Amount'),
                AppTextbox(
                    label: 'Amount',
                    validator: Validators().checkFieldEmpty,
                    controller: amountController,
                    textInputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d{0,4}\.?\d{0,2}')),
                    ]),
                AppDatebox(
                  label: 'Subscription Start Date',
                  validator: Validators().checkFieldEmpty,
                  controller: subStartController,
                ),
                AppDatebox(
                  label: 'Subscription End Date',
                  validator: Validators().checkFieldEmpty,
                  controller: subEndController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                          text: 'Add New',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //calim Item service to be called to create a claim item
                              billNumberController;
                              billDateController;
                              expenseCodeController;
                              costCenterController;
                              amountController;
                              subStartController;
                              subEndController;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ClaimItemPage()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Claim Item added.')),
                              );
                              log('Claim created.');
                            }
                          }),
                      AppButton(
                          text: 'Submit',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Claim Updated.')),
                              );
                              log('Claim created.');
                            }
                          }),
                      AppButton(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateClaimPage()),
                            );
                            log('Cancel button clicked.');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
