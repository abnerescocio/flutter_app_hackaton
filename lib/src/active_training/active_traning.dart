import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/animated_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/one_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/MusicButtons.dart';
import '../themes/custom_colors.dart';

class ActiveTrainingScreen extends StatelessWidget {
  const ActiveTrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          Row(
            children: [
              Spacer(),
              SvgPicture.asset('assets/images/icons/sound_mute_light.svg'),
              const SizedBox(
                width: 27,
              ),
            ],
          ),
          Row(
            children: const [
              OneWidget(
                icon: 'refresh_white',
                label: '1/3',
                topMargin: 65,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const AnimatedCircleWidget(
            firstIcon: "weight_with_clock",
            circleColor: CustomColors.primaryPurpleDark,
            titleInside: "60",
            subtitleInside: "Exercite",
          ),
          const SizedBox(
            height: 20,
          ),
          const OneWidget(icon: "timer", label: "4:00", topMargin: 20),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: const [
              Spacer(),
              MusicButtons(
                backGround: "outlined_ellipse",
                playerIcon: "pause",
                width: 56,
                height: 56,
              ),
              SizedBox(
                width: 16,
              ),
              MusicButtons(
                backGround: "elipse",
                playerIcon: "play_black",
                width: 72,
                height: 72,
              ),
              SizedBox(
                width: 16,
              ),
              MusicButtons(
                backGround: "outlined_ellipse",
                playerIcon: "forwad",
                width: 56,
                height: 56,
              ),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
