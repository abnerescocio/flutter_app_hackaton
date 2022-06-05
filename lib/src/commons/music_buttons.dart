import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class MusicButtons extends StatelessWidget {
  const MusicButtons({
    Key? key,
    required this.backGround,
    required this.playerIcon,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String backGround;
  final String playerIcon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: width,
          width: height,
          child: SvgPicture.asset('assets/images/icons/$backGround.svg'),
        ),
        SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset('assets/images/icons/$playerIcon.svg'),
        ),
      ],
    );
  }
}
