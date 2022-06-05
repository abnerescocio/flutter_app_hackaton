import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/components/base_button.dart';
import 'package:flutter_app_hackaton/src/configuration_screen/configuration_view.dart';
import 'package:flutter_app_hackaton/src/pre_training/pre_training.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class FirstTraingScreen extends StatelessWidget {
  static const String routeName = "/first";
  const FirstTraingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.mainBackground,
          leading: GestureDetector(
            onTap: () {
              finished(context);
            },
            child: const Icon(Icons.close),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: Svg('assets/images/icons/Tabata-training.svg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Vamos começar o seu primeiro Treino Tabata?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lato-Black',
              fontSize: 20,
              color: CustomColors.neutralColor20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 32, right: 32),
            child: Text(
              "No próximo passo você vai criar o Tabata ideal para o seu treino.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
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
