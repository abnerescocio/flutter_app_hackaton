class ConverterUtils {
  static String toMinutesAndSeconds(num? seconds) {
    final duration = Duration(seconds: seconds?.toInt() ?? 0);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static int toSeconds(int minutes, int seconds) {
    return Duration(minutes: minutes, seconds: seconds).inSeconds;
  }
}
