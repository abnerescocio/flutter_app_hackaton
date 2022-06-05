import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/one_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/custom_colors.dart';

class AnimatedCircleWidget extends StatelessWidget {
  const AnimatedCircleWidget({
    Key? key,
    required this.circleColor,
    required this.titleInside,
    required this.subtitleInside, required this.firstIcon,
  }) : super(key: key);
  final Color circleColor;
  final String titleInside;
  final String subtitleInside;
  final String firstIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Column(
        children: [
          SizedBox(
            child: SvgPicture.asset('assets/images/icons/$firstIcon.svg'),
          ),
          SizedBox(
            child: Text(titleInside,
                style: const TextStyle(
                    fontSize: 62, color: CustomColors.neutralColor20)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            subtitleInside,
            style: TextStyle(fontSize: 18, color: CustomColors.neutralColor20),
          ),
          const OneWidget(
            icon: 'weight_white',
            label: "20/20",
            topMargin: 30,
          )
        ],
      ),
      const SizedBox(
        height: 280,
        width: 280,
        child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: CustomColors.neutralColor90,
            valueColor:
                AlwaysStoppedAnimation<Color>(CustomColors.neutralColor30)),
      ),
      const SizedBox(
        height: 268,
        width: 268,
        child: CircularProgressIndicator(
            strokeWidth: 10,
            backgroundColor: CustomColors.neutralColor90,
            valueColor:
                AlwaysStoppedAnimation<Color>(CustomColors.primaryPurpleDark)),
      ),
    ]);
  }
}
