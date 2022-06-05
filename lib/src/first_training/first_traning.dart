import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/base_button.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_svg/svg.dart';

class FirstTraingScreen extends StatelessWidget {
  const FirstTraingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset('assets/images/icons/Tabata-training.svg', fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Vamos começar o seu primeiro Treino Tabata?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Lato-Black',
                fontSize: 20,
                color: CustomColors.neutralColor20),
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
                  color: CustomColors.neutralColor20),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          BaseButton(text: "Criar Tabata")
        ],
      ),
    );
  }
}
