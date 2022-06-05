import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';

class RegressiveScreen extends StatefulWidget {
  const RegressiveScreen({Key? key}) : super(key: key);
  static String routeName = "regression-screen";
  @override
  State<RegressiveScreen> createState() => _RegressiveScreenState();
}

class _RegressiveScreenState extends State<RegressiveScreen> {
  int _counter = 3;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter == 0) {
          nextScreen();
          return;
        }
        _counter -= 1;
      });
    });
  }

  void nextScreen() {}

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Center(
        child: Text(
          "$_counter",
          style: const TextStyle(fontSize: 60, color: Colors.white),
        ),
      ),
    );
  }
}
