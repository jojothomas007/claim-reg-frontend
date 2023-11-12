import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  Icon? icon;
  VoidCallback onPressed;

  AppButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black54,
          letterSpacing: 2.0,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
