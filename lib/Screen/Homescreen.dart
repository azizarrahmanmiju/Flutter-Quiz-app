import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Service/getinfo.dart';
import 'package:quiz/widget/bottom_nave.dart';
import 'package:quiz/widget/dropdownbutton.dart';

final db = FirebaseAuth.instance;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> value = ['java', 'c++', 'python', 'dart'];
  String? dropdownvalue;
  @override
  void initState() {
    super.initState();
    getquestion(value.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNave(),
    );
  }
}
