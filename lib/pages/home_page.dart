import 'dart:developer';

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
        width: 80,
        height: 200,
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
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getImageButton(context, 'New Claim', Icons.add_box,
                      const CreateClaimPage()),
                  getImageButton(context, 'My Claims', Icons.view_list_rounded,
                      const ClaimDetailsPage()),
                  getImageButton(context, 'For Approval',
                      Icons.playlist_add_check, const ClaimDetailsPage()),
                ],
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
