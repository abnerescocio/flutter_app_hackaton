import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            children:  [
              SizedBox(
                height: 80,
              ),
              Text(
                "Treino finalizado!",
                style: TextStyle(
                  fontSize: 28,
                  color: CustomColors.neutralColor20,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Spacer(),
                  VerticalListWidget(
                    icon: 'weight_white',
                    value: "20",
                    label: 'Séries',
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'refresh_white',
                    value: "3",
                    label: 'Ciclos',
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'timer_white',
                    value: "10",
                    label: 'Tempo total ',
                  ),
                  const Spacer(),
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
            height: 48,
          ),
          BaseButton(
            text: "Criar Tabata",
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
