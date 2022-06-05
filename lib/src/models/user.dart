class User {
  static String collection = "users";

  final bool isFirstAccess;

  final num seriesTimeInSeconds;
  final num sleepTimeInSeconds;
  final num cycleIntervalInSeconds;

  final num seriesQuantity;
  final num cycleQuantity;

  User(
    this.isFirstAccess,
    this.seriesTimeInSeconds,
    this.sleepTimeInSeconds,
    this.cycleIntervalInSeconds,
    this.seriesQuantity,
    this.cycleQuantity,
  );

  num totalTimeInSconds() {
    return ((seriesTimeInSeconds * seriesQuantity) +
            (sleepTimeInSeconds * (seriesQuantity - 1))) *
        (cycleQuantity + (cycleIntervalInSeconds * (cycleQuantity - 1)));
  }
}
