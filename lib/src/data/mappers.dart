import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserMapper {
  static String fieldIsFirstAccess = "isFirstAccess";

  static Map<String, dynamic> toMap(User user) => <String, dynamic>{
        fieldIsFirstAccess: user.isFirstAccess,
      };

  static User fromSnapshot(DocumentSnapshot snapshot) {
    final dynamic data = snapshot.data();
    final bool isFirstAccess = data[fieldIsFirstAccess];
    return User(isFirstAccess);
  }
}
