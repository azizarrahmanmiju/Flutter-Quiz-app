import 'package:flutter/material.dart';

class dropdownbutton extends StatefulWidget {
  dropdownbutton({super.key, required this.value, required this.ondropvalue});

  final List<String> value;
  final void Function(String value) ondropvalue;

  @override
  State<dropdownbutton> createState() => _DropdownbuttonState();
}

class _DropdownbuttonState extends State<dropdownbutton> {
  String dropdownvalue = 'java';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          focusColor: Colors.blue,
          value: dropdownvalue,
          style: const TextStyle(color: Color.fromARGB(255, 0, 26, 255)),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                dropdownvalue = newValue; // Update state with the new value
              });
              widget.ondropvalue(dropdownvalue);
            }
          },
          items: widget.value.map(
            (String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
