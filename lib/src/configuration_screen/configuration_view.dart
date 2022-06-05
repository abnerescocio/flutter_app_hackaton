import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/data/mappers.dart';
import 'package:flutter_app_hackaton/src/pre_training/pre_training.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../components/bigger_base_button.dart';
import '../components/leave_feature.dart';
import '../components/wheel_amount_selector.dart';
import '../components/wheel_time_selector.dart';
import '../models/user.dart';

class ConfigurationScreen extends StatefulWidget {
  static const String routeName = "/config";

  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  late final GetUserBloc getUserBloc;
  late final SetUserBloc setUserBloc;
  User? user;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    getUserBloc = GetUserBloc();
    getUserBloc.add(GetUserEvent("time_10"));

    setUserBloc = SetUserBloc();
  }

  @override
  void dispose() {
    super.dispose();
    getUserBloc.close();
  }

  void _showDialog(Widget child, {double height = 322}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: height,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CustomColors.mainBackground,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
        bloc: getUserBloc,
        builder: (context, state) {
          if (state is SuccessGetUserState) {
            user = state.user;
          } else {
            user = null;
          }

          num seriesTimeInSeconds = user?.seriesTimeInSeconds ?? 0;
          num cycleQuantity = user?.cycleQuantity ?? 0;
          num sleepTimeInSeconds = user?.sleepTimeInSeconds ?? 0;
          num seriesQuantity = user?.seriesQuantity ?? 0;
          num cycleIntervalInSeconds = user?.cycleIntervalInSeconds ?? 0;

          return Scaffold(
              appBar: AppBar(
                title: const Text("Configurações"),
                leading: GestureDetector(
                  onTap: finished,
                  child: const Icon(Icons.close),
                ),
                backgroundColor: CustomColors.mainBackground,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(2),
                  child: Container(
                    color: CustomColors.neutralColor70,
                    height: 2,
                  ),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 23, 25, 28),
              body: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 24),
                  const InfoRow(info: "Toque nas opções para editar"),
                  const SizedBox(height: 16),
                  SelectionItem(
                    label: "Tempo da série",
                    time:
                        ConverterUtils.toMinutesAndSeconds(seriesTimeInSeconds),
                    iconName: "weight_with_clock",
                    callback: () {
                      _showDialog(
                        WheelTimeSelector(
                          callback: (seconds) {
                            Navigator.pop(context);
                            setState(() {
                              _hasChanges = true;
                              user?.seriesTimeInSeconds = seconds;
                            });
                          },
                          value: seriesTimeInSeconds.toInt(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de séries",
                    time: "$seriesQuantity",
                    iconName: "weight",
                    callback: () {
                      _showDialog(
                        WheelAmountSelector(
                            value: seriesQuantity.toInt(),
                            callback: (value) {
                              Navigator.pop(context);
                              setState(() {
                                _hasChanges = true;
                                user?.seriesQuantity = value;
                              });
                            }),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo de descanso",
                    time: ConverterUtils.toMinutesAndSeconds(
                      sleepTimeInSeconds,
                    ),
                    iconName: "couch-timer",
                    callback: () {
                      _showDialog(WheelTimeSelector(
                        callback: (seconds) {
                          Navigator.pop(context);
                          setState(() {
                            _hasChanges = true;
                            user?.sleepTimeInSeconds = seconds;
                          });
                        },
                        value: sleepTimeInSeconds.toInt(),
                      ));
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de ciclos",
                    time: "$cycleQuantity",
                    iconName: "refresh",
                    callback: () {
                      _showDialog(
                        WheelAmountSelector(
                          value: cycleQuantity.toInt(),
                          callback: (value) {
                            Navigator.pop(context);
                            setState(() {
                              _hasChanges = true;
                              user?.cycleQuantity = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    enabled: (user?.cycleQuantity ?? 0) > 1,
                    label: "Intervalo entre ciclos",
                    time: ConverterUtils.toMinutesAndSeconds(
                        cycleIntervalInSeconds),
                    iconName: (user?.cycleQuantity ?? 0) > 1
                        ? "rest"
                        : "rest-disable",
                    bgColor: (user?.cycleQuantity ?? 0) > 1
                        ? CustomColors.neutralColor90
                        : CustomColors.neutralColor100,
                    strokeColor: (user?.cycleQuantity ?? 0) > 1
                        ? CustomColors.neutralColor90
                        : CustomColors.neutralColor100,
                    callback: () {
                      _showDialog(
                        WheelTimeSelector(
                          callback: (seconds) {
                            Navigator.pop(context);
                            setState(() {
                              _hasChanges = true;
                              user?.cycleIntervalInSeconds = seconds;
                            });
                          },
                          value: cycleIntervalInSeconds.toInt(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo total",
                    time: ConverterUtils.toMinutesAndSeconds(
                      user?.totalTimeInSconds(),
                    ),
                    iconName: "complete-timer",
                    callback: () {},
                    textColor: CustomColors.primaryPurple,
                    bgColor: CustomColors.mainBackground,
                    strokeColor: CustomColors.neutralColor80,
                  ),
                  const Spacer(),
                  BiggerBaseButton(text: "Salvar", onPressed: save),
                  const SizedBox(height: 24)
                ],
              ));
        });
  }

  void save() {
    final newUser = UserMapper.fromUser(user);
    setUserBloc.add(SetUserEvent('time_10', newUser));
    Future.delayed(const Duration(seconds: 1), finished);
  }

  void finished() {
    if (_hasChanges) {
      _showDialog(
        LeaveFeatureAlert(
          yes: () {
            goToPreTreining();
          },
          no: () {
            Navigator.pop(context);
          },
        ),
        height: 360,
      );
    } else {
      goToPreTreining();
    }
  }

  void goToPreTreining() {
    Navigator.pushReplacementNamed(context, PreTraningScreen.routeName);
  }
}

class SelectionItem extends StatefulWidget {
  final String label;
  final String time;
  final String iconName;
  final Function() callback;
  final bool enabled;
  final Color textColor;
  final Color bgColor;
  final Color strokeColor;

  const SelectionItem({
    this.enabled = true,
    this.textColor = Colors.white,
    this.bgColor = CustomColors.neutralColor90,
    this.strokeColor = CustomColors.neutralColor90,
    Key? key,
    required this.label,
    required this.time,
    required this.iconName,
    required this.callback,
  }) : super(key: key);

  @override
  SelectionItemState createState() => SelectionItemState();
}

class SelectionItemState extends State<SelectionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.enabled
            ? () {
                widget.callback();
              }
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: widget.strokeColor,
              )),
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  "assets/images/icons/${widget.iconName}.svg",
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                    color: widget.enabled ? widget.textColor : Colors.grey),
              ),
              const Spacer(),
              Text(
                widget.time,
                style: TextStyle(
                    color: widget.enabled ? widget.textColor : Colors.grey),
              ),
              const SizedBox(width: 16)
            ],
          ),
        ));
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({Key? key, required this.info}) : super(key: key);
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        SizedBox(
          height: 16,
          width: 16,
          child: SvgPicture.asset("assets/images/icons/Info_fill.svg"),
        ),
        const SizedBox(width: 8),
        Text(info, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
