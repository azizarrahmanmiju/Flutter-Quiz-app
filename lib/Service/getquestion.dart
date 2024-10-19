import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

Future<void> getAllCollectionsExceptUsers() async {
  try {
    final allCollections = await db.collection('Users').get();
    print(allCollections.docs);
  } catch (e) {
    print('Error getting collections: $e');
  }
}
