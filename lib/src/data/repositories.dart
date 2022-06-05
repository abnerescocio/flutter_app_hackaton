import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserRepository {
  final _database = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getById(String userId) async {
    return _database.collection(User.collection).doc(userId).get();
  }

  Future<void> save(Map<String, dynamic> user, String userId) async {
    return _database
        .collection(User.collection)
        .doc(userId)
        .set(user, SetOptions(merge: true));
  }
}
