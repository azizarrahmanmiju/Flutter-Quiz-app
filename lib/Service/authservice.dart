import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;

class Authservice {
  static void loginservice(context, String email, String password) {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  static void accountcreation(context, String email, String username,
      String password, File image) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final storageref = await FirebaseStorage.instance
          .ref()
          .child("Users_images")
          .child(response.user!.uid);

      await storageref.putFile(image);
      final imageurl = await storageref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(response.user!.uid)
          .set({
        "name": username,
        "email": email,
        "propic": imageurl,
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }
}
