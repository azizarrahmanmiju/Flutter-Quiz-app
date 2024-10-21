import 'package:flutter/material.dart';

class sinnglequestion extends StatelessWidget {
  const sinnglequestion(
      {super.key, required this.question, required this.dropdownvalue});

  final List question;
  final String dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: question.length, // Use .length on the docs list
      itemBuilder: (context, index) {
        var questionData = question[index].data() as Map<String, dynamic>;
        return Card(
          color: Colors.white,
          child: ListTile(
            title: Text(
              questionData['question'] ?? 'No question',
              style: const TextStyle(
                  color: Color.fromARGB(255, 4, 49, 250), fontSize: 18),
            ),
            subtitle: Text(dropdownvalue),
          ),
        );
      },
    );
  }
}
