import 'package:flutter/material.dart';

class AppDropdown<T> extends StatefulWidget {
  final String label;
  final List<T> itemList;
  FormFieldValidator<T>? validator;
  ValueChanged onChanged;
  T? value;

  AppDropdown({
    Key? key,
    required this.label,
    required this.itemList,
    this.validator,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState<T> extends State<AppDropdown> {
  // T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<T>(
        value: widget.value,
        validator: widget.validator,
        onChanged: widget.onChanged,
        //     (val) {
        //   setState(() {
        //     _selectedItem = val as T;
        //   });
        // },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Colors.lightBlue,
          size: 30,
        ),
        decoration: InputDecoration(
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
        items: widget.itemList
            .map<DropdownMenuItem<T>>(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
              ),
            )
            .toList(),
      ),
    );
  }
}
