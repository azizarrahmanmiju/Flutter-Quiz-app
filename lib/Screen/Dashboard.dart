import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Service/getquestion.dart';
import 'package:quiz/widget/bottom_nave.dart';

final db = FirebaseAuth.instance;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    getAllCollectionsExceptUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNave(),
    );
  }
}
