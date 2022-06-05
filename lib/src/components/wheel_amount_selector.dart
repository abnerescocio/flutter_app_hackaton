import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_hackaton/src/components/selection_wheel.dart';

import '../base_button.dart';

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
  void initState() {
    super.initState();
    _newValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var wheel1 = SingleWheelSelector(
        label: "",
        initialValue: 0,
        finallValue: 60,
        value: widget.value,
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
