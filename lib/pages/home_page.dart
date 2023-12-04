import 'dart:developer';

import 'package:claim_reg_frontend/enums/claim_status.dart';
import 'package:claim_reg_frontend/pages/claim_details_page.dart';
import 'package:claim_reg_frontend/pages/create_claim_page.dart';
import 'package:flutter/material.dart';

import '../widgets/BaseAppBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ElevatedButton getImageButton(
      BuildContext context, String text, IconData iconData, Widget pageWidget) {
    return ElevatedButton(
      onPressed: () {
        log("Pressed button : '$text'");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageWidget),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 60, maxHeight: 120),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Home',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'Claim Registration made easy !',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: getImageButton(context, 'New Claim', Icons.add_box,
                      const CreateClaimPage()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: getImageButton(
                      context,
                      'For Submission',
                      Icons.view_list_rounded,
                      const ClaimDetailsPage(
                        heading: 'For Submission',
                        claimStatus: ClaimStatus.created,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: getImageButton(
                      context,
                      'For Approval',
                      Icons.playlist_add_check,
                      const ClaimDetailsPage(
                          heading: 'For Approval',
                          claimStatus: ClaimStatus.submitted)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
