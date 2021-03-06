import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/configuration_screen/configuration_view.dart';
import 'package:flutter_app_hackaton/src/finished_training/finished_training.dart';
import 'package:flutter_app_hackaton/src/first_training/first_traning.dart';
import 'package:flutter_app_hackaton/src/pre_training/pre_training.dart';
import 'package:flutter_app_hackaton/src/regressive_screen/regressive_screen.dart';
import 'package:flutter_app_hackaton/src/splash/splash.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_app_hackaton/src/treining/list_training.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'active_training/active_traning.dart';
import 'congrats/congrats.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        fontFamily: 'Lato',
        backgroundColor: CustomColors.mainBackground,
        primaryColor: CustomColors.primaryPurple,
      ),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case PreTraningScreen.routeName:
                return const PreTraningScreen();
              case FirstTraingScreen.routeName:
                return const FirstTraingScreen();
              case FinishedTrainingScreen.routeName:
                return const FinishedTrainingScreen();
              case ConfigurationScreen.routeName:
                return const ConfigurationScreen();
              case ActiveTrainingScreen.routeName:
                return const ActiveTrainingScreen();
              case CongratsScreen.routeName:
                return const CongratsScreen();
              case RegressiveScreen.routeName:
                return const RegressiveScreen();
              case ListTrainingScreen.routeName:
                return const ListTrainingScreen();
              default:
                return const SplashScreen();
            }
          },
        );
      },
    );
  }
}
