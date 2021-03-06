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
    required this.subtitleInside,
    required this.firstIcon,
    required this.seriesAmountTotal,
    required this.seriesCount,
    required this.progressValue1,
    required this.progressValuer2,
  }) : super(key: key);
  final Color circleColor;
  final String titleInside;
  final String subtitleInside;
  final String firstIcon;
  final String seriesAmountTotal;
  final String seriesCount;
  final double progressValue1;
  final double progressValuer2;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 42),
            child: SizedBox(
              child: SvgPicture.asset('assets/images/icons/$firstIcon.svg'),
            ),
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
          OneWidget(
            icon: 'weight_white',
            label: "$seriesCount/$seriesAmountTotal",
            topMargin: 30,
          )
        ],
      ),
      SizedBox(
        height: 280,
        width: 280,
        child: CircularProgressIndicator(
            value: progressValuer2,
            strokeWidth: 2,
            backgroundColor: CustomColors.neutralColor90,
            valueColor: const AlwaysStoppedAnimation<Color>(
                CustomColors.neutralColor30)),
      ),
      SizedBox(
        height: 268,
        width: 268,
        child: CircularProgressIndicator(
            value: progressValue1,
            strokeWidth: 10,
            backgroundColor: circleColor,
            valueColor: const AlwaysStoppedAnimation<Color>(
                CustomColors.neutralColor90)),
      ),
    ]);
  }
}
