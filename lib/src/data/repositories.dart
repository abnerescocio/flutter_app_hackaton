import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/models/training.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserRepository {
  final _database = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getById(String userId) async {
    return _database.collection(User.collection).doc(userId).get();
  }

  Future<void> saveUser(
    Map<String, dynamic> user,
    String userId,
  ) async {
    return _database
        .collection(User.collection)
        .doc(userId)
        .set(user, SetOptions(merge: true));
  }

  Future<DocumentReference> saveUserTraining(
    Map<String, dynamic> training,
    String userId,
  ) async {
    return _database
        .collection(User.collection)
        .doc(userId)
        .collection(Training.collection)
        .add(training);
  }
}
