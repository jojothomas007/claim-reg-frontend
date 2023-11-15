import 'package:claim_reg_frontend/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatebox extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  TextEditingController? controller;
  Widget? prefixIcon;

  AppDatebox(
      {Key? key,
      required this.label,
      this.validator,
      this.controller,
      this.prefixIcon})
      : super(key: key);

  @override
  State<AppDatebox> createState() => _AppDateboxState();
}

class _AppDateboxState extends State<AppDatebox> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
        String formattedDate =
            DateFormat(Constants.dateFormat).format(_dateTime);
        widget.controller?.text = formattedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: true,
        onTap: _showDatePicker,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: IconButton(
              onPressed: _showDatePicker,
              icon: const Icon(Icons.calendar_month),
            )),
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
