import 'dart:developer';

import 'package:claim_reg_frontend/pages/claim_item_page.dart';
import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDropdown.dart';
import 'package:flutter/material.dart';

import '../models/Claim.dart';
import '../widgets/BaseAppBar.dart';

class CreateClaimPage extends StatefulWidget {
  const CreateClaimPage({Key? key}) : super(key: key);

  @override
  State<CreateClaimPage> createState() => _CreateClaimPageState();
}

class _CreateClaimPageState extends State<CreateClaimPage> {
  late Future<Claim> futureClaim;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Create Claim',
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
                AppDropdown(label: 'Claim Type', itemList: ['Internet Bill']),
                AppDropdown(label: 'Claimant', itemList: [
                  'Jojo Thomas',
                ]),
                AppDropdown(label: 'Currency', itemList: ['INR']),
                AppDropdown(label: 'Approver', itemList: [
                  'Biju Abraham',
                ]),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 40.0),
                //   child: Text(
                //     'claim details',
                //     style: TextStyle(
                //       color: Colors.blue,
                //       letterSpacing: 2.0,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       fontStyle: FontStyle.italic,
                //       decoration: TextDecoration.underline,
                //     ),
                //     textAlign: TextAlign.center,
                //     // textAlign: TextAlign.center,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: AppButton(
                    text: 'Save and Proceed',
                    onPressed: () {
                      log('Save and Proceed button clicked');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClaimItemPage()),
                      );
                    },
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
