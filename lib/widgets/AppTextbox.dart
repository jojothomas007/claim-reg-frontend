import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextbox extends StatelessWidget {
  final String label;

  AppTextbox({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            style: const TextStyle(
              color: Colors.blueGrey,
              letterSpacing: 2.0,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
