import 'package:flutter/cupertino.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_svg/svg.dart';

class TrainingIntensity extends StatelessWidget {
  const TrainingIntensity({
    Key? key,
    required this.label,
    required this.iconName,
    required this.callback,
    required this.selected,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);

  final String label;
  final String iconName;
  final Function() callback;
  final bool selected;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: selected ? bgColor : CustomColors.neutralColor90,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                selected
                    ? "assets/images/icons/$iconName.svg"
                    : "assets/images/icons/$iconName-disabled.svg",
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? textColor : CustomColors.neutralColor40,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ));
  }
}
