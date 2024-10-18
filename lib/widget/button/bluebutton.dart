// TODO Implement this library.
import 'package:flutter/material.dart';

class Bluebutton extends StatelessWidget {
  const Bluebutton({
    super.key,
    required this.onpress,
    required this.btntext,
  });
  final onpress;
  final btntext;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 60, 255),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            btntext,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
