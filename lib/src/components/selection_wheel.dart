import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/base_button.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
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

class CupertinoPickerSample extends StatefulWidget {
  const CupertinoPickerSample({Key? key}) : super(key: key);

  @override
  State<CupertinoPickerSample> createState() => _CupertinoPickerSampleState();
}

class _CupertinoPickerSampleState extends State<CupertinoPickerSample> {
  int _selectedFruit = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 312,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CustomColors.mainBackground,
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return Container()Ma;
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTextStyle(
        style: TextStyle(
          color: CustomColors.mainBackground,
          fontSize: 22.0,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Selected fruit: '),
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Display a CupertinoPicker with list of fruits.
                onPressed: () => _showDialog(const WheelTimeSelector()),
                // This displays the selected fruit name.
                child: Text(
                  _minutes[_selectedFruit],
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return CupertinoPageScaffold(
    //   child:
    // );
  }
}

class WheelTimeSelector extends StatelessWidget {
  const WheelTimeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const wheel1 =
        SingleWheelSelector(label: "Minutos", initialValue: 0, finallValue: 60);
    const wheel2 = SingleWheelSelector(
        label: "Segundos", initialValue: 0, finallValue: 60);

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
          BaseButton(text: "Selecionar")
        ],
      ),
    );
  }
}

class WheelAmountSelector extends StatelessWidget {
  const WheelAmountSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const wheel1 =
        SingleWheelSelector(label: "", initialValue: 0, finallValue: 60);

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
          BaseButton(text: "Selecionar")
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
      required this.finallValue})
      : super(key: key);

  final String label;
  final int initialValue;
  final int finallValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 12, color: CustomColors.neutralColor40)),
        SizedBox(width: 40, height: 150, child: WheelPicker()),
      ],
    );
  }
}

class CustomPicker extends StatelessWidget {
  const CustomPicker(
      {Key? key, required this.initialValue, required this.finalValue})
      : super(key: key);

  final int initialValue;
  final int finalValue;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: initialValue,
      maxValue: finalValue,
      itemCount: finalValue - initialValue,
      value: 54,
      textMapper: (value) {
        return value.toString().padLeft(2, '0');
      },
      // infiniteLoop: false,
      onChanged: (value) {},
      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      textStyle:
          const TextStyle(color: CustomColors.neutralColor50, fontSize: 24),
    );
  }
}

class WheelPicker extends StatefulWidget {
  const WheelPicker({Key? key}) : super(key: key);

  @override
  _WheelPickerState createState() => _WheelPickerState();
}

class _WheelPickerState extends State<WheelPicker> {
  int _currentValue = 3;

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
          value: _currentValue,
          textMapper: (value) {
            return value.toString().padLeft(2, '0');
          },
          infiniteLoop: false,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
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
