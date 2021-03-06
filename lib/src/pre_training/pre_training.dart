import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/commons/static_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/vertical_list_widget.dart';
import 'package:flutter_app_hackaton/src/configuration_screen/configuration_view.dart';
import 'package:flutter_app_hackaton/src/models/user.dart';
import 'package:flutter_app_hackaton/src/treining/list_training.dart';
import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/app_states.dart';
import '../components/bigger_base_button.dart';
import '../themes/custom_colors.dart';

class PreTraningScreen extends StatefulWidget {
  const PreTraningScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  State<PreTraningScreen> createState() => _PreTraningScreenState();
}

class _PreTraningScreenState extends State<PreTraningScreen> {
  late GetUserBloc bloc;
  User? user;

  @override
  void initState() {
    super.initState();
    bloc = GetUserBloc();
    bloc.add(GetUserEvent("time_10"));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is SuccessGetUserState) {
          user = state.user;
        } else {
          user = null;
        }
        return Scaffold(
          backgroundColor: CustomColors.mainBackground,
          body: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  const Spacer(),
                  VerticalListWidget(
                    icon: 'weight_white',
                    value: "${user?.seriesQuantity ?? 0}",
                    label: 'S??ries',
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'refresh_white',
                    value: "${user?.cycleQuantity ?? 0}",
                    label: 'Ciclos',
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  VerticalListWidget(
                    icon: 'timer_white',
                    value: ConverterUtils.toMinutesAndSeconds(
                        user?.totalTimeInSconds()),
                    label: 'Tempo total ',
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const StaticCircleWidget(
                  circleColor: CustomColors.primaryPurpleDark),
              const SizedBox(
                height: 75,
              ),
              BiggerBaseButton(
                text: "Editar Tabata",
                onPressed: goToConfiguration,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/icons/timer_white.svg'),
                label: 'Tabata',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/icons/weight_white.svg'),
                label: 'Treinos',
              ),
            ],
            currentIndex: 0,
            backgroundColor: CustomColors.mainBackground,
            selectedItemColor: Colors.white,
            onTap: (int index) {
              if (index == 1) {
                Navigator.pushReplacementNamed(
                    context, ListTrainingScreen.routeName);
              }
            },
          ),
        );
      },
    );
  }

  void goToConfiguration() {
    Navigator.pushReplacementNamed(context, ConfigurationScreen.routeName);
  }
}
