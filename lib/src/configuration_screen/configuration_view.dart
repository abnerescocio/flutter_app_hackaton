import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/base_button.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/components/selection_wheel.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_app_hackaton/src/utils/converter_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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

  num? _seriesTimeInSeconds;
  num? _seriesQuantity;
  num? _sleepTimeInSeconds;
  num? _cycleQuantity;
  num? _cycleIntervalInSeconds;

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

  void _showDialog(Widget child) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 312,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CustomColors.mainBackground,
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
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

          return Scaffold(
              appBar: AppBar(
                title: const Text("Configurações"),
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
                    time: ConverterUtils.toMinutesAndSeconds(
                      _seriesTimeInSeconds ?? user?.seriesTimeInSeconds,
                    ),
                    icon_name: "weight_with_clock",
                    callback: () {
                      _showDialog(
                        WheelTimeSelector(callback: (seconds) {
                          Navigator.pop(context);
                          setState(() {
                            _seriesTimeInSeconds = seconds;
                          });
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de séries",
                    time: "${_seriesQuantity ?? user?.seriesQuantity ?? 0}",
                    icon_name: "weight",
                    callback: () {
                      _showDialog(
                        WheelAmountSelector(
                            value: 0,
                            callback: (value) {
                              Navigator.pop(context);
                              setState(() {
                                _seriesQuantity = value;
                              });
                            }),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo de descanso",
                    time: ConverterUtils.toMinutesAndSeconds(
                      _sleepTimeInSeconds ?? user?.sleepTimeInSeconds ?? 0,
                    ),
                    icon_name: "couch-timer",
                    callback: () {
                      _showDialog(WheelTimeSelector(callback: (seconds) {
                        Navigator.pop(context);
                        setState(() {
                          _sleepTimeInSeconds = seconds;
                        });
                      }));
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de ciclos",
                    time: "${_cycleQuantity ?? user?.cycleQuantity ?? 0}",
                    icon_name: "refresh",
                    callback: () {
                      _showDialog(WheelAmountSelector(
                          value: 0,
                          callback: (value) {
                            Navigator.pop(context);
                            setState(() {
                              _cycleQuantity = value;
                            });
                          }));
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Intervalo entre ciclos",
                    time: ConverterUtils.toMinutesAndSeconds(
                        _cycleIntervalInSeconds ??
                            user?.cycleIntervalInSeconds),
                    icon_name: "rest-disable",
                    callback: () {
                      _showDialog(WheelTimeSelector(callback: (seconds) {
                        Navigator.pop(context);
                        setState(() {
                          _cycleIntervalInSeconds = seconds;
                        });
                      }));
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo total",
                    time: ConverterUtils.toMinutesAndSeconds(
                      user?.totalTimeInSconds(),
                    ),
                    icon_name: "complete-timer",
                    callback: () {},
                  ),
                  const Spacer(),
                  BaseButton(text: "Salvar", onPressed: save),
                  const SizedBox(height: 24)
                ],
              ));
        });
  }

  void save() {
    final newUser = User(
      true,
      _seriesTimeInSeconds ?? 0,
      _sleepTimeInSeconds ?? 0,
      _cycleIntervalInSeconds ?? 0,
      _seriesQuantity ?? 0,
      _cycleQuantity ?? 0,
    );
    setUserBloc.add(SetUserEvent('time_10', newUser));
  }
}

class SelectionItem extends StatefulWidget {
  final String label;
  final String time;
  final String icon_name;
  final Function() callback;

  const SelectionItem({
    Key? key,
    required this.label,
    required this.time,
    required this.icon_name,
    required this.callback,
  }) : super(key: key);

  @override
  _SelectionItemState createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.callback();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 34, 38, 42),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                      "assets/images/icons/${widget.icon_name}.svg")),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(widget.time, style: const TextStyle(color: Colors.white)),
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
            child: SvgPicture.asset("assets/images/icons/Info_fill.svg")),
        const SizedBox(width: 8),
        Text(info, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
