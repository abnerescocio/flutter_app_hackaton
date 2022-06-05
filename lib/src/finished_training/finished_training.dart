import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/components/training_intensity.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/vertical_list_widget.dart';
import '../components/base_button.dart';
import '../configuration_screen/configuration_view.dart';
import '../pre_training/pre_training.dart';
import '../themes/custom_colors.dart';
import '../utils/converter_utils.dart';

class FinishedTrainingScreen extends StatefulWidget {
  const FinishedTrainingScreen({Key? key}) : super(key: key);

  @override
  State<FinishedTrainingScreen> createState() => _FinishedTrainingScreenState();
}

class _FinishedTrainingScreenState extends State<FinishedTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.primaryPurpleDark,
          leading: GestureDetector(
            onTap: () {
              finished(context);
            },
            child: const Icon(Icons.close),
          ),
          flexibleSpace: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Treino finalizado!",
                style: TextStyle(
                  fontSize: 28,
                  color: CustomColors.neutralColor20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  Spacer(),
                  VerticalListWidget(
                    icon: 'weight_white',
                    value: "20",
                    label: 'Séries',
                  ),
                  SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'refresh_white',
                    value: "3",
                    label: 'Ciclos',
                  ),
                  SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'timer_white',
                    value: "10",
                    label: 'Tempo total ',
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Como foi seu treino?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lato-Black',
              fontSize: 18,
              color: CustomColors.neutralColor20,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              TrainingIntensity(
                label: "Leve",
                iconName: "leve",
                callback: () {},
                selected: true,
                bgColor: CustomColors.greenDark,
                textColor: CustomColors.green,
              ),
              const SizedBox(
                width: 48,
              ),
              TrainingIntensity(
                  label: "Moderado",
                  iconName: "moderado",
                  callback: () {},
                  selected: true,
                  bgColor: CustomColors.primaryPurpleDark,
                  textColor: CustomColors.primaryPurple),
              const SizedBox(
                width: 48,
              ),
              TrainingIntensity(
                label: "Intenso",
                iconName: "intenso",
                callback: () {},
                selected: true,
                bgColor: CustomColors.redDark,
                textColor: CustomColors.red,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 32, right: 32),
            child: Text(
              "Deixe aqui mais detalhes:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: CustomColors.neutralColor20,
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                fillColor: CustomColors.neutralColor20,
                hintStyle: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: CustomColors.neutralColor50,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: CustomColors.neutralColor50),
                ),
                hintText: 'Conte mais sobre seu treino (opcional)',
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          BaseButton(
            text: "Salvar",
            onPressed: () {
              goToConfiguration(context);
            },
          )
        ],
      ),
    );
  }

  void goToConfiguration(BuildContext context) {
    Navigator.pushNamed(context, ConfigurationScreen.routeName);
  }

  void finished(BuildContext context) {
    Navigator.pushNamed(context, PreTraningScreen.routeName);
  }
}
