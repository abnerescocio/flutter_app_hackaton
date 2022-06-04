import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/data/mappers.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserRepository {
  Future<DocumentSnapshot> getById(String userId) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }

  Future<void> save(User user, String userId) async {
    final data = UserMapper.toMap(user);
    return FirebaseFirestore.instance.collection("users").doc(userId).set(data);
  }
}
