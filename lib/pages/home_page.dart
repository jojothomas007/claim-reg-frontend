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
        constraints: const BoxConstraints(
            minWidth: 60, maxWidth: 100, minHeight: 140, maxHeight: 180),
        // width: 100,
        // height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Icon(
                iconData,
                size: 70,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
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
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Claim Registration made easy !',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getImageButton(context, 'New Claim', Icons.add_box,
                          const CreateClaimPage()),
                      getImageButton(
                          context,
                          'For Submission',
                          Icons.view_list_rounded,
                          const ClaimDetailsPage(
                            claimStatus: ClaimStatus.created,
                          )),
                      getImageButton(
                          context,
                          'For Approval',
                          Icons.playlist_add_check,
                          const ClaimDetailsPage(
                              claimStatus: ClaimStatus.submitted)),
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
