import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserRepository {
  Future<DocumentSnapshot> getById(String userId) async {
    return FirebaseFirestore.instance
        .collection(User.collection)
        .doc(userId)
        .get();
  }

  Future<void> save(Map<String, dynamic> user, String userId) async {
    return FirebaseFirestore.instance
        .collection(User.collection)
        .doc(userId)
        .set(user);
  }
}
