import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/Model/Quation.dart';

final db = FirebaseFirestore.instance;

class Addquestion {
  static Future<void> addquestion(
      String type, question, correctoption, boption, coption, doption) async {
    await db.collection(type).add({
      "question": question,
      "correctoption": correctoption,
      "boption": boption,
      "coption": coption,
      "doption": doption,
    });
    print('Question added');
  }
}
