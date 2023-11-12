import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final List<String> itemList;

  AppDropdown({Key? key, required this.label, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // for (AppDropdownMenuItem item in itemList){
    //   DropdownMenuItem dfs = item.build(context);
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
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
        items: itemList
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text("$option"),
                ))
            .toList(),
        onChanged: (Object? value) {},
      ),
    );
  }
}
