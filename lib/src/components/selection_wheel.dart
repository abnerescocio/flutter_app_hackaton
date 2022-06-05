import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/base_button.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:numberpicker/numberpicker.dart';

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
            initialValue: value,
          ),
        ),
      ],
    );
  }
}

class WheelPicker extends StatefulWidget {
  const WheelPicker(
      {Key? key, required this.callback, required this.initialValue})
      : super(key: key);

  final Function(int value) callback;
  final int initialValue;

  @override
  _WheelPickerState createState() => _WheelPickerState();
}

class _WheelPickerState extends State<WheelPicker> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant WheelPicker oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // widget.callback(_value);
  }

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
