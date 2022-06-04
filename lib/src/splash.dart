import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColors.mainBackground,
        body: Center(
          child: Lottie.asset('assets/lottie/splash_animation.json',
              width: 190, height: 231, alignment: Alignment.center,),
        ),
      ),
    );
  }
}
