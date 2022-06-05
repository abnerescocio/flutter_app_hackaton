import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 48,
            width: 296,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: CustomColors.primaryPurpleDark,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseTextButton extends StatelessWidget {
  const BaseTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 48,
            width: 296,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: CustomColors.primaryPurpleDark,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
