import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserMapper {
  static Map<String, dynamic> toMap(User user) => <String, dynamic>{
        "hasFirstAccess": user.hasFirstAccess,
      };

  static User fromSnapshot(DocumentSnapshot snapshot) {
    final dynamic data = snapshot.data();
    final bool hasFirstAccess = data["hasFirstAccess"];
    return User(hasFirstAccess);
  }
}
