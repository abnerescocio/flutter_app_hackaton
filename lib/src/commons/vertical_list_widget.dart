import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/custom_colors.dart';

class VerticalListWidget extends StatelessWidget {
  const VerticalListWidget({
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
    return Column(
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
          style:
              const TextStyle(fontSize: 20, color: CustomColors.neutralColor20),
        ),
      ],
    );
  }
}
