import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/configuration_screen/configuration_view.dart';
import 'package:flutter_app_hackaton/src/pre_training/pre_training.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static String routerName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late GetUserBloc bloc;

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
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: BlocBuilder<GetUserBloc, GetUserState>(
        bloc: bloc,
        builder: (context, state) {
          late final String nextRoute;

          if (state is SuccessGetUserState) {
            if (state.user.isFirstAccess) {
              nextRoute = ConfigurationScreen.routeName;
            } else {
              nextRoute = PreTraningScreen.routeName;
            }
          } else if (state is ErrorGetUserState) {
            nextRoute = PreTraningScreen.routeName;
          } else {
            nextRoute = "";
          }

          if (nextRoute != "") {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Navigator.pushReplacementNamed(context, nextRoute);
              },
            );
          }

          return const SplashAnimation();
        },
      ),
    );
  }
}

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/splash_animation.json',
        width: 190,
        height: 231,
        alignment: Alignment.center,
      ),
    );
  }
}
