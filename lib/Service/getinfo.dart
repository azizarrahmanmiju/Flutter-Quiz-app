import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

Stream<QuerySnapshot> getquestion(String type) {
  try {
    return db.collection(type).snapshots();
  } catch (error) {
    return const Stream.empty();
  }
}

Stream<DocumentSnapshot?> getUSerinfo() {
  try {
    final docRef = db.collection("Users").doc(auth.currentUser!.uid);
    return docRef.snapshots(); // Return a stream of real-time updates
  } catch (e) {
    print("Error getting document: $e");
    return const Stream.empty(); // Return an empty stream in case of an error
  }
}
