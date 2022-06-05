import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/base_button.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:numberpicker/numberpicker.dart';

const double _kItemExtent = 32.0;
const List<String> _minutes = <String>[
  '00',
  '01',
  '02',
  '03',
  '04',
  '05',
];

class WheelTimeSelector extends StatefulWidget {
  const WheelTimeSelector({Key? key, required this.callback}) : super(key: key);
  final Function(int value) callback;

  @override
  State<WheelTimeSelector> createState() => _WheelTimeSelectorState();
}

class _WheelTimeSelectorState extends State<WheelTimeSelector> {
  int _minutesNewValue = 0;
  int _secondsNewValue = 0;

  @override
  Widget build(BuildContext context) {
    var wheel1 = SingleWheelSelector(
        label: "Minutos",
        initialValue: 0,
        finallValue: 60,
        value: 0,
        callback: (value) {
          setState(() {
            _minutesNewValue = value;
          });
        });
    var wheel2 = SingleWheelSelector(
        label: "Segundos",
        initialValue: 0,
        finallValue: 60,
        value: 0,
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

class WheelAmountSelector extends StatefulWidget {
  const WheelAmountSelector(
      {Key? key, required this.value, required this.callback})
      : super(key: key);
  final int value;
  final Function(int value) callback;

  @override
  State<WheelAmountSelector> createState() => _WheelAmountSelectorState();
}

class _WheelAmountSelectorState extends State<WheelAmountSelector> {
  int _newValue = 0;

  @override
  Widget build(BuildContext context) {
    var wheel1 = SingleWheelSelector(
        label: "",
        initialValue: 0,
        finallValue: 60,
        value: this.widget.value,
        callback: (value) {
          setState(() {
            _newValue = value;
          });
        });

    return Container(
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text("Quantidade de Séries",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          const SizedBox(height: 18),
          Row(children: [
            const Spacer(),
            wheel1,
            const Spacer(),
          ]),
          const SizedBox(height: 32),
          BaseButton(
              text: "Selecionar",
              onPressed: () {
                widget.callback(_newValue);
              })
        ],
      ),
    );
  }
}

class SingleWheelSelector extends StatelessWidget {
  const SingleWheelSelector(
      {Key? key,
      required this.label,
      required this.initialValue,
      required this.finallValue,
      required this.value,
      required this.callback})
      : super(key: key);

  final String label;
  final int initialValue;
  final int finallValue;
  final int value;
  final Function(int value) callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style:
              const TextStyle(fontSize: 12, color: CustomColors.neutralColor40),
        ),
        SizedBox(
          width: 40,
          height: 150,
          child: WheelPicker(
            callback: callback,
          ),
        ),
      ],
    );
  }
}

class WheelPicker extends StatefulWidget {
  const WheelPicker({Key? key, required this.callback}) : super(key: key);

  final Function(int value) callback;

  @override
  _WheelPickerState createState() => _WheelPickerState();
}

class _WheelPickerState extends State<WheelPicker> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: 52,
          child: Column(
            children: [
              Container(height: 2, color: CustomColors.primaryPurpleDark),
              SizedBox(height: 48),
              Container(height: 2, color: CustomColors.primaryPurpleDark)
            ],
          ),
        ),
        NumberPicker(
          minValue: 0,
          maxValue: 60,
          value: _value,
          textMapper: (value) {
            return value.toString().padLeft(2, '0');
          },
          infiniteLoop: false,
          onChanged: (value) {
            widget.callback(value);
            setState(() {
              _value = value;
            });
          },
          selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
          textStyle:
              const TextStyle(color: CustomColors.neutralColor50, fontSize: 24),
        )
      ],
    );
  }
}
