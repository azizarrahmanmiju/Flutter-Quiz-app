import 'package:flutter/material.dart';

class Titletext extends StatelessWidget {
  final title;
  final subtitle;

  const Titletext({super.key, required this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(255, 4, 0, 255),
            fontSize: size.width * 0.08,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(255, 18, 18, 19),
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
