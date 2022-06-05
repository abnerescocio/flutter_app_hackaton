class User {
  static String collection = "users";

  final bool isFirstAccess;

  num seriesTimeInSeconds;
  num sleepTimeInSeconds;
  num cycleIntervalInSeconds;

  num seriesQuantity;
  num cycleQuantity;

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
            cycleQuantity +
        (cycleIntervalInSeconds * (cycleQuantity - 1));
  }
}
