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

  static Map<String, dynamic> toMap(SetUserEvent event) {
    return <String, dynamic>{
      fieldIsFirstAccess: event.user.isFirstAccess,
      fieldSeriesTimeInSeconds: event.user.seriesTimeInSeconds,
      fieldSleepTimeInSeconds: event.user.sleepTimeInSeconds,
      fieldCycleIntervalInSeconds: event.user.cycleIntervalInSeconds,
      fieldSeriesQuantity: event.user.seriesQuantity,
      fieldCycleQuantity: event.user.cycleQuantity,
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

  static User fromUser(User? user) {
    return User(
      user?.isFirstAccess ?? false,
      user?.seriesTimeInSeconds ?? 0,
      user?.sleepTimeInSeconds ?? 0,
      user?.cycleIntervalInSeconds ?? 0,
      user?.seriesQuantity ?? 0,
      user?.cycleQuantity ?? 0,
    );
  }
}

class TrainingMapper {
  static String fieldIntensity = "intensity";
  static String fieldComment = "comment";
  static String fieldDateTime = "dateTime";

  static String fieldSeriesTimeInSeconds = "seriesTimeInSeconds";
  static String fieldSleepTimeInSeconds = "sleepTimeInSeconds";
  static String fieldCycleIntervalInSeconds = "cycleIntervalInSeconds";

  static String fieldSeriesQuantity = "seriesQuantity";
  static String fieldCycleQuantity = "cycleQuantity";

  static Map<String, dynamic> toMap(SetUserTrainingEvent event) {
    return <String, dynamic>{
      fieldIntensity: event.training.intensity.toString(),
      fieldComment: event.training.comment,
      fieldDateTime: event.training.dateTime.toString(),
      fieldSeriesTimeInSeconds: event.training.seriesTimeInSeconds,
      fieldSleepTimeInSeconds: event.training.sleepTimeInSeconds,
      fieldCycleIntervalInSeconds: event.training.cycleIntervalInSeconds,
      fieldSeriesQuantity: event.training.seriesQuantity,
      fieldCycleQuantity: event.training.cycleQuantity,
    };
  }
}
