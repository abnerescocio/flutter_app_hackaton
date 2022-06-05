import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/finished_training/finished_training.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:lottie/lottie.dart';

class CongratsScreen extends StatefulWidget {
  static const String routerName = "/congrats";

  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Builder(
        builder: (context) {
          Future.delayed(
            const Duration(seconds: 3),
            () {
              Navigator.pushReplacementNamed(
                context,
                FinishedTrainingScreen.routeName,
              );
            },
          );
          return Center(
            child: Lottie.asset(
              'assets/lottie/congrats.json',
              width: 190,
              height: 231,
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }
}
