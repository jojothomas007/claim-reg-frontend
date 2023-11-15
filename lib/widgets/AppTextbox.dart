import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextbox extends StatefulWidget {
  final String label;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? controller;
  Widget? prefixIcon;

  AppTextbox(
      {Key? key,
      required this.label,
      this.validator,
      this.controller,
      this.textInputType,
      this.inputFormatters,
      this.prefixIcon})
      : super(key: key);
  @override
  State<AppTextbox> createState() => _AppTextboxState();
}

class _AppTextboxState extends State<AppTextbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          labelText: widget.label,
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
