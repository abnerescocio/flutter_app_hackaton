import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_hackaton/src/data/mappers.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

import '../../firebase_options.dart';

class UserRepository {
  Future<DocumentSnapshot> getById(String userId) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }

  Future<void> save(User user, String userId) async {
    final data = UserMapper.toMap(user);
    return FirebaseFirestore.instance.collection("users").doc(userId).set(data);
  }
}
