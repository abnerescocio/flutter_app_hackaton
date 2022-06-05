import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
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

  num _seriesTimeInSeconds = 0;
  num _seriesQuantity = 0;
  num _sleepTimeInSeconds = 0;
  num _cycleQuantity = 0;
  num _cycleIntervalInSeconds = 0;

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
                      user?.seriesTimeInSeconds,
                    ),
                    icon_name: "weight_with_clock",
                    callback: (value) {
                      setState(() {
                        _seriesTimeInSeconds = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de séries",
                    time: "${user?.seriesQuantity ?? 0}",
                    icon_name: "weight",
                    callback: (value) {},
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo de descanso",
                    time: ConverterUtils.toMinutesAndSeconds(
                      user?.sleepTimeInSeconds,
                    ),
                    icon_name: "couch-timer",
                    callback: (value) {},
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Quantidade de ciclos",
                    time: "${user?.cycleQuantity ?? 0}",
                    icon_name: "refresh",
                    callback: (value) {},
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Intervalo entre ciclos",
                    time: ConverterUtils.toMinutesAndSeconds(
                      user?.cycleIntervalInSeconds,
                    ),
                    icon_name: "rest-disable",
                    callback: (value) {},
                  ),
                  const SizedBox(height: 8),
                  SelectionItem(
                    label: "Tempo total",
                    time: ConverterUtils.toMinutesAndSeconds(
                      user?.totalTimeInSconds(),
                    ),
                    icon_name: "complete-timer",
                    callback: (value) {},
                  ),
                ],
              ));
        });
  }

  void save() {}
}

class SelectionItem extends StatefulWidget {
  final String label;
  final String time;
  final String icon_name;
  final Function(int value) callback;

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
    return Container(
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
    );
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
