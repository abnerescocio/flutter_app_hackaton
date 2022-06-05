import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base_button.dart';
import '../themes/custom_colors.dart';

class PreTraningScreen extends StatelessWidget {
  const PreTraningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Column(
        children: [
          Row(
            children: const [
              SizedBox(
                height: 100,
              ),
              ListWidget(icon: 'weight_white', value: '8', label: 'Séries'),
              ListWidget(icon: 'refresh_white', value: '1', label: 'Ciclos'),
              ListWidget(
                  icon: 'timer_white', value: '4:00', label: 'Tempo total '),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const CircleWidget(circleColor: CustomColors.primaryPurpleDark),
          const SizedBox(
            height: 75,
          ),
          BaseButton(
            text: "Editar Tabata",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
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

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);
  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 39, right: 26),
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
                    fontSize: 12, color: CustomColors.neutralColor20),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 20, color: CustomColors.neutralColor20),
          ),
        ],
      ),
    );
  }
}
