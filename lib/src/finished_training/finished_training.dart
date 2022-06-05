import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/components/training_intensity.dart';
import 'package:flutter_app_hackaton/src/models/intensity.dart';
import 'package:flutter_app_hackaton/src/models/training.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_states.dart';
import '../commons/vertical_list_widget.dart';
import '../components/base_button.dart';
import '../components/bigger_base_button.dart';
import '../configuration_screen/configuration_view.dart';
import '../models/user.dart';
import '../pre_training/pre_training.dart';
import '../themes/custom_colors.dart';

class FinishedTrainingScreen extends StatefulWidget {
  static const String routreName = "/finishTraining";

  const FinishedTrainingScreen({Key? key}) : super(key: key);

  @override
  State<FinishedTrainingScreen> createState() => _FinishedTrainingScreenState();
}

class _FinishedTrainingScreenState extends State<FinishedTrainingScreen> {
  late final GetUserBloc getUserBloc;
  late final SetUserTrainingBloc setUserTrainingBloc;

  User? _user;

  Intensity? _currentIntensity;
  String? _comment;

  @override
  void initState() {
    super.initState();
    getUserBloc = GetUserBloc();
    getUserBloc.add(GetUserEvent("time_10"));

    setUserTrainingBloc = SetUserTrainingBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: getUserBloc,
        builder: (context, state) {
          if (state is SuccessGetUserState) {
            _user = state.user;
          } else {
            _user = null;
          }

          return Scaffold(
              backgroundColor: CustomColors.mainBackground,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(200),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: CustomColors.primaryPurpleDark,
                  leading: GestureDetector(
                    onTap: () {
                      finished(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                  flexibleSpace: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        "Treino finalizado!",
                        style: TextStyle(
                          fontSize: 28,
                          color: CustomColors.neutralColor20,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: const [
                          Spacer(),
                          VerticalListWidget(
                            icon: 'weight_white',
                            value: "20",
                            label: 'Séries',
                          ),
                          SizedBox(
                            width: 48,
                          ),
                          VerticalListWidget(
                            icon: 'refresh_white',
                            value: "3",
                            label: 'Ciclos',
                          ),
                          SizedBox(
                            width: 48,
                          ),
                          VerticalListWidget(
                            icon: 'timer_white',
                            value: "10",
                            label: 'Tempo total ',
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Como foi seu treino?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Lato-Black',
                        fontSize: 18,
                        color: CustomColors.neutralColor20,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TrainingIntensity(
                          label: "Leve",
                          iconName: "leve",
                          callback: () {
                            setState(() {
                              _currentIntensity = Intensity.low;
                            });
                          },
                          selected: _currentIntensity == Intensity.low,
                          bgColor: CustomColors.greenDark,
                          textColor: CustomColors.green,
                        ),
                        const SizedBox(
                          width: 48,
                        ),
                        TrainingIntensity(
                            label: "Moderado",
                            iconName: "moderado",
                            callback: () {
                              setState(() {
                                _currentIntensity = Intensity.mid;
                              });
                            },
                            selected: _currentIntensity == Intensity.mid,
                            bgColor: CustomColors.primaryPurpleDark,
                            textColor: CustomColors.primaryPurple),
                        const SizedBox(
                          width: 48,
                        ),
                        TrainingIntensity(
                          label: "Intenso",
                          iconName: "intenso",
                          callback: () {
                            setState(() {
                              _currentIntensity = Intensity.high;
                            });
                          },
                          selected: _currentIntensity == Intensity.high,
                          bgColor: CustomColors.redDark,
                          textColor: CustomColors.red,
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, left: 32, right: 32),
                      child: Text(
                        "Deixe aqui mais detalhes:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          color: CustomColors.neutralColor20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                _comment = text;
                              });
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: 6,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: CustomColors.neutralColor20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 15),
                              fillColor: CustomColors.neutralColor20,
                              hintStyle: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: CustomColors.neutralColor50,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: CustomColors.neutralColor50),
                              ),
                              hintText:
                                  'Conte mais sobre seu treino (opcional)',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    BiggerBaseButton(
                      text: "Salvar",
                      onPressed: () {
                        goToConfiguration(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void goToConfiguration(BuildContext context) {
    final newTraining = Training(
      _comment ?? "",
      _currentIntensity ?? Intensity.low,
      DateTime.now(),
      _user?.seriesTimeInSeconds ?? 0,
      _user?.sleepTimeInSeconds ?? 0,
      _user?.cycleIntervalInSeconds ?? 0,
      _user?.seriesQuantity ?? 0,
      _user?.cycleQuantity ?? 0,
    );

    setUserTrainingBloc.add(SetUserTrainingEvent("time_10", newTraining));

    Future.delayed(const Duration(microseconds: 1500), () {
      Navigator.pushNamed(context, ConfigurationScreen.routeName);
    });
  }

  void finished(BuildContext context) {
    Navigator.pushNamed(context, PreTraningScreen.routeName);
  }
}
