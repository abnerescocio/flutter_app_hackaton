import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/static_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/vertical_list_widget.dart';

import '../base_button.dart';
import '../themes/custom_colors.dart';

class PreTraningScreen extends StatelessWidget {
  const PreTraningScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            children: const [
              Spacer(),
              VerticalListWidget(
                  icon: 'weight_white', value: '8', label: 'Séries'),
              SizedBox(
                width: 48,
              ),
              VerticalListWidget(
                  icon: 'refresh_white', value: '1', label: 'Ciclos'),
              SizedBox(
                width: 48,
              ),
              VerticalListWidget(
                  icon: 'timer_white', value: '4:00', label: 'Tempo total '),
              Spacer(),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const StaticCircleWidget(circleColor: CustomColors.primaryPurpleDark),
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
