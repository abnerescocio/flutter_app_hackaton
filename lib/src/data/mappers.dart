import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';

class UserMapper {
  static String fieldIsFirstAccess = "isFirstAccess";

  static String fieldSeriesTimeInSeconds = "seriesTimeInSeconds";
  static String fieldSleepTimeInSeconds = "sleepTimeInSeconds";
  static String fieldCycleIntervalInSeconds = "cycleIntervalInSeconds";

  static String fieldSeriesQuantity = "seriesQuantity";
  static String fieldCycleQuantity = "cycleQuantity";

  static toMap(SetUserIsFirstAccessEvent event) {
    return <String, dynamic>{
      fieldIsFirstAccess: event.isFirstAccess,
    };
  }

  static User fromSnapshot(DocumentSnapshot snapshot) {
    final dynamic data = snapshot.data();

    final bool isFirstAccess = data[fieldIsFirstAccess];

    final num seriesTimeInSeconds = data[fieldSeriesTimeInSeconds] ?? 20;
    final num sleepTimeInSeconds = data[fieldSleepTimeInSeconds] ?? 10;
    final num cycleIntervalInSeconds = data[fieldCycleIntervalInSeconds] ?? 0;

    final num seriesQuantity = data[fieldSeriesQuantity] ?? 8;
    final num cycleQuantity = data[fieldCycleQuantity] ?? 1;

    return User(
      isFirstAccess,
      seriesTimeInSeconds,
      sleepTimeInSeconds,
      cycleIntervalInSeconds,
      seriesQuantity,
      cycleQuantity,
    );
  }
}
