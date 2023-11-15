import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextbox extends StatelessWidget {
  final String label;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? controller;

  AppTextbox(
      {Key? key,
      required this.label,
      this.validator,
      this.controller,
      this.textInputType,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            letterSpacing: 2.0,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: const TextStyle(
          color: Colors.blueGrey,
          letterSpacing: 2.0,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
