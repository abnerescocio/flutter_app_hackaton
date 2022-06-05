import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/custom_colors.dart';
import 'base_button.dart';

class LeaveFeatureAlert extends StatelessWidget {
  const LeaveFeatureAlert({
    Key? key,
    required this.yes,
    required this.no,
  }) : super(key: key);

  final Function() yes;
  final Function() no;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        SvgPicture.asset(
          "assets/images/icons/atencao.svg",
          height: 100,
          width: 100,
        ),
        const Text(
          "Tem certeza que deseja sair?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Lato-Black',
            fontSize: 20,
            color: CustomColors.neutralColor20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, left: 65, right: 65),
          child: Text(
            "Ao sair, as alterações realizadas não serão salvas.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              color: CustomColors.neutralColor20,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        BaseButton(
          text: "Sair",
          onPressed: yes,
        ),
        const SizedBox(
          height: 20,
        ),
        BaseTextButton(
          text: "Voltar",
          onPressed: no,
        ),
      ],
    );
  }
}
