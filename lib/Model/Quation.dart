import 'package:flutter/foundation.dart';

class Question {
  Question({
    required this.question,
    required this.correctanswer,
    required this.boption,
    required this.coption,
    required this.doption,
  });

  final String question;
  final String correctanswer;
  final String boption;
  final String coption;
  final String doption;

  factory Question.fromfirestore(Map<String, dynamic> data) {
    return Question(
      question: data['question'],
      correctanswer: data['correctansweer'],
      boption: data['boption'],
      coption: data['coption'],
      doption: data['doption'],
    );
  }
}
