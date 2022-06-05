import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_hackaton/src/components/selection_wheel.dart';
import '../base_button.dart';
import '../utils/converter_utils.dart';

class WheelTimeSelector extends StatefulWidget {
  const WheelTimeSelector(
      {Key? key, required this.callback, required this.value})
      : super(key: key);
  final Function(int value) callback;
  final int value;
  @override
  State<WheelTimeSelector> createState() => _WheelTimeSelectorState();
}

class _WheelTimeSelectorState extends State<WheelTimeSelector> {
  int _minutesNewValue = 0;
  int _secondsNewValue = 0;

  late List initalValues = ConverterUtils.toMinutesAndSecondsNums(widget.value);
  late int initialMinutes = initalValues[0];
  late int initialSeconds = initalValues[1];

  @override
  void initState() {
    super.initState();
    _minutesNewValue = initialMinutes;
    _secondsNewValue = initialSeconds;
  }

  @override
  Widget build(BuildContext context) {
    var wheel1 = SingleWheelSelector(
        label: "Minutos",
        initialValue: 0,
        finallValue: 60,
        value: initialMinutes,
        callback: (value) {
          setState(() {
            _minutesNewValue = value;
          });
        });
    var wheel2 = SingleWheelSelector(
        label: "Segundos",
        initialValue: 0,
        finallValue: 60,
        value: initialSeconds,
        callback: (value) {
          setState(() {
            _secondsNewValue = value;
          });
        });

    return Container(
      child: Column(
        children: [
          const SizedBox(height: 14),
          const Text("Tempo da série",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          const SizedBox(height: 18),
          Row(children: [
            const Spacer(),
            wheel1,
            const SizedBox(width: 11),
            const Text(":",
                style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(width: 11),
            wheel2,
            const Spacer(),
          ]),
          const SizedBox(height: 32),
          BaseButton(
            text: "Selecionar",
            onPressed: () {
              widget.callback(
                ConverterUtils.toSeconds(_minutesNewValue, _secondsNewValue),
              );
            },
          )
        ],
      ),
    );
  }
}
