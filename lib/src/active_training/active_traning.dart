import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/animated_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/one_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/music_buttons.dart';
import '../themes/custom_colors.dart';
import '../utils/converter_utils.dart';

enum TrainnigStatus { rest, trainning }

class ActiveTrainingScreen extends StatefulWidget {
  const ActiveTrainingScreen({Key? key}) : super(key: key);

  static const routeName = "active-trainning";

  @override
  State<ActiveTrainingScreen> createState() => _ActiveTrainingScreenState();
}

class _ActiveTrainingScreenState extends State<ActiveTrainingScreen> {
  TrainnigStatus _trainnigStatus = TrainnigStatus.trainning;
  bool _isPaused = false;

  final int _trainningTime = 3;
  final int _restingTime = 2;
  final int _totalCyclesAmount = 3;
  final int _totalSeriesAmount = 3;

  int _trainningTimeCount = 10;
  int _restingTimeCount = 5;
  int _totalTimeCount = 0;
  int _cyclesCount = 1;
  int _seriesCount = 1;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _totalTimeCount = _totalTimeCount + 1;
        switch (_trainnigStatus) {
          case TrainnigStatus.trainning:
            if (_trainningTimeCount > 0) {
              _trainningTimeCount = _trainningTimeCount - 1;
            } else {
              _trainnigStatus = TrainnigStatus.rest;
              _trainningTimeCount = _trainningTime;
            }
            break;
          case TrainnigStatus.rest:
            if (_restingTimeCount > 0) {
              _restingTimeCount = _restingTimeCount - 1;
            } else {
              _trainnigStatus = TrainnigStatus.trainning;
              _restingTimeCount = _restingTime;
              _seriesCount = _seriesCount + 1;
              if (_seriesCount == _totalSeriesAmount + 1) {
                _cyclesCount = _cyclesCount + 1;
                _seriesCount = 1;
                if (_cyclesCount == _totalCyclesAmount) {
                  timer.cancel();
                }
              }
            }
            break;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _trainningTimeCount = _trainningTime;
    _restingTimeCount = _restingTime;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
      body: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          Row(
            children: [
              Spacer(),
              SvgPicture.asset('assets/images/icons/sound_mute_light.svg'),
              const SizedBox(
                width: 27,
              ),
            ],
          ),
          Row(
            children: [
              OneWidget(
                icon: 'refresh_white',
                label: '$_cyclesCount/$_totalCyclesAmount',
                topMargin: 65,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          AnimatedCircleWidget(
            firstIcon: "weight_with_clock",
            circleColor: _trainnigStatus == TrainnigStatus.trainning
                ? CustomColors.primaryPurple
                : CustomColors.green,
            titleInside: _trainnigStatus == TrainnigStatus.trainning
                ? "$_trainningTimeCount"
                : "$_restingTimeCount",
            subtitleInside: _trainnigStatus == TrainnigStatus.trainning
                ? "Exercite"
                : "Descanse",
            seriesCount: '$_seriesCount',
            seriesAmountTotal: '$_totalSeriesAmount',
          ),
          const SizedBox(
            height: 20,
          ),
          OneWidget(
              icon: "timer",
              label: "${ConverterUtils.toMinutesAndSeconds(_totalTimeCount)} ",
              topMargin: 20),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              const Spacer(),
              const MusicButtons(
                backGround: "outlined_ellipse",
                playerIcon: "pause",
                width: 56,
                height: 56,
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                child: MusicButtons(
                  backGround: "elipse",
                  playerIcon: _isPaused ? "pause" : "play_black",
                  width: 72,
                  height: 72,
                ),
                onTap: () {
                  setState(() {
                    _isPaused = !_isPaused;
                    _isPaused ? _timer?.cancel() : startTimer();
                  });
                },
              ),
              const SizedBox(
                width: 16,
              ),
              const MusicButtons(
                backGround: "outlined_ellipse",
                playerIcon: "forwad",
                width: 56,
                height: 56,
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
