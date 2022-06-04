import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';

class BaseButton extends StatelessWidget {
  BaseButton({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
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
              child: Text(text, style: TextStyle(fontFamily: 'Lato')),
            ),
          ),
        ],
      ),
    );
  }
}
