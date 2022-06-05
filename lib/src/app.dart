import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/configuration_screen/configuration_view.dart';
import 'package:flutter_app_hackaton/src/finished_training/finished_training.dart';
import 'package:flutter_app_hackaton/src/first_training/first_traning.dart';
import 'package:flutter_app_hackaton/src/pre_training/pre_training.dart';
import 'package:flutter_app_hackaton/src/splash/splash.dart';
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
      theme: ThemeData(),
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
              case FinishedTrainingScreen.routreName:
                return const FinishedTrainingScreen();
              case ConfigurationScreen.routeName:
                return const ConfigurationScreen();
              case ActiveTrainingScreen.routeName:
                return const ActiveTrainingScreen();
              case CongratsScreen.routerName:
                return const CongratsScreen();
              default:
                return const SplashScreen();
            }
          },
        );
      },
    );
  }
}
