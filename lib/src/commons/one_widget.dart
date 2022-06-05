import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/custom_colors.dart';

class OneWidget extends StatelessWidget {
  const OneWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.topMargin,
  }) : super(key: key);
  final String icon;
  final String label;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: topMargin, left: 160),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: SvgPicture.asset(
                  'assets/images/icons/$icon.svg',
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 18, color: CustomColors.neutralColor20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}