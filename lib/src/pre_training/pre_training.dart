import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/static_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/vertical_list_widget.dart';

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
              VerticalListWidget(icon: 'weight_white', value: '8', label: 'Séries'),
              VerticalListWidget(icon: 'refresh_white', value: '1', label: 'Ciclos'),
              VerticalListWidget(
                  icon: 'timer_white', value: '4:00', label: 'Tempo total '),
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
