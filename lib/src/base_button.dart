import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
        backgroundColor: CustomColors.mainBackground,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _BaseButtonTabata();
}

class _BaseButtonTabata extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
    );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 484),
          Container(
            height: 48,
            width: 296,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: CustomColors.primaryPurpleDark,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
              onPressed: () {},
              child: const Text('Criar tabata',
                  style: TextStyle(fontFamily: 'Lato')),
            ),
          ),
        ],
      ),
    );
  }
}
