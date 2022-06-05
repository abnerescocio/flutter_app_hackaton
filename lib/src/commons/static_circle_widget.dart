import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/custom_colors.dart';

class StaticCircleWidget extends StatelessWidget {
  const StaticCircleWidget({
    Key? key,
    required this.circleColor,
  }) : super(key: key);

  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: SvgPicture.asset('assets/images/icons/play.svg'),
          ),
          const SizedBox(
            height: 23,
          ),
          const Text(
            "Toque para iniciar",
            style: TextStyle(fontSize: 18, color: CustomColors.neutralColor20),
          ),
        ],
      ),
      SizedBox(
        height: 280,
        width: 280,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(140),
          ),
        ),
      ),
      SizedBox(
        height: 268,
        width: 268,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: circleColor, width: 10),
            borderRadius: BorderRadius.circular(140),
          ),
        ),
      ),
    ]);
  }
}
