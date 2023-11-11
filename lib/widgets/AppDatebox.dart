import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatebox extends StatefulWidget {
  final String label;

  const AppDatebox({Key? key, required this.label}) : super(key: key);

  @override
  State<AppDatebox> createState() => _AppDateboxState(label);
}

class _AppDateboxState extends State<AppDatebox> {
  String label;
  DateTime _dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();

  _AppDateboxState(this.label);

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_dateTime);
        controller.text = formattedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         TextFormField(
            readOnly: true,
            onTap: _showDatePicker,
            controller: controller,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // hintText: 'Choose date',
                // hintStyle: const TextStyle(
                //   color: Colors.grey,
                //   letterSpacing: 2.0,
                //   fontSize: 15,
                //   fontStyle: FontStyle.italic,
                // ),
                suffixIcon: IconButton(
                  onPressed: _showDatePicker,
                  icon: Icon(Icons.calendar_month),
                )),
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
