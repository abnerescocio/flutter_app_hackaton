import 'package:flutter_app_hackaton/src/models/intensity.dart';

class Training {
  final String comment;
  final Intensity intensity;
  final DateTime dateTime;

  final num seriesTimeInSeconds;
  final num sleepTimeInSeconds;
  final num cycleIntervalInSeconds;

  final num seriesQuantity;
  final num cycleQuantity;

  Training(
    this.comment,
    this.intensity,
    this.dateTime,
    this.seriesTimeInSeconds,
    this.sleepTimeInSeconds,
    this.cycleIntervalInSeconds,
    this.seriesQuantity,
    this.cycleQuantity,
  );

  static String collection = "trainings";
}
