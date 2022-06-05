import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Converting Functions", () {
    test("toMinutesAndSecons when num is 150 should return 02:30", () {
      var result = ConverterUtils.toMinutesAndSeconds(150);

      expect(result, "02:30");
    });

    test("toMinutesAndSecondsNums when num is 150 should return [2, 30]", () {
      var result = ConverterUtils.toMinutesAndSecondsNums(150);

      expect(result[0], 2);
      expect(result[1], 30);
    });

    test("toSeconds when minutes is 2 and second is 30 should return 150", () {
      var result = ConverterUtils.toSeconds(2, 30);

      expect(result, 150);
    });
  });
}
