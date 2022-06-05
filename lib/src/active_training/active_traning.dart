import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/commons/animated_circle_widget.dart';
import 'package:flutter_app_hackaton/src/commons/one_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/music_buttons.dart';
import '../themes/custom_colors.dart';
import '../utils/converter_utils.dart';

enum TrainnigStatus { rest, trainning, preparing, interval }

class ActiveTrainingScreen extends StatefulWidget {
  const ActiveTrainingScreen({Key? key}) : super(key: key);

  static const routeName = "active-trainning";

  @override
  State<ActiveTrainingScreen> createState() => _ActiveTrainingScreenState();
}

class _ActiveTrainingScreenState extends State<ActiveTrainingScreen> {
  TrainnigStatus _trainnigStatus = TrainnigStatus.trainning;
  bool _isPaused = false;

  final int _trainningTime = 5;
  final int _restingTime = 5;
  final int _totalCyclesAmount = 2;
  final int _totalSeriesAmount = 2;
  final int _totalCyclesInterval = 10;

  int _trainningTimeCount = 4;
  int _restingTimeCount = 5;
  int _totalTimeCount = 0;
  int _cyclesCount = 1;
  int _seriesCount = 1;
  int _cyclesIntervalTimeCount = 10;

  Timer? _timer;

  List getStatusViewModel(TrainnigStatus status) {
    switch (status) {
      case TrainnigStatus.trainning:
        return [
          "Exercite",
          "weight_with_clock",
          CustomColors.primaryPurpleDark,
          _trainningTimeCount,
          _trainningTime
        ];

      case TrainnigStatus.rest:
        return [
          "Descanse",
          "couch-timer",
          CustomColors.green,
          _restingTimeCount,
          _restingTime
        ];

      case TrainnigStatus.preparing:
        return ["Prepare-se", "couch-timer", CustomColors.green, ""];
      case TrainnigStatus.interval:
        return [
          "Intervalo",
          "couch-timer",
          CustomColors.green,
          _cyclesIntervalTimeCount,
          _totalCyclesInterval
        ];
    }
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

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeStep();
      trainningStep();
      intervalStep();
      restStep();
      trainningToRest();
      trainningToInterval();
      trainningToFinish();
      intervalToTrainnig();
      restToTrainning();
    });
  }

  void timeStep() {
    setState(() {
      _totalTimeCount += 1;
    });
  }

  void trainningToRest() {
    if (_trainnigStatus == TrainnigStatus.trainning &&
        _trainningTimeCount < 0 &&
        _seriesCount < _totalSeriesAmount) {
      setState(() {
        _trainnigStatus = TrainnigStatus.rest;
        _trainningTimeCount = _trainningTime;
      });
    }
  }

  void trainningToInterval() {
    if (_trainnigStatus == TrainnigStatus.trainning &&
        _trainningTimeCount == 0 &&
        _seriesCount == _totalSeriesAmount &&
        _cyclesCount < _totalCyclesAmount) {
      setState(() {
        _trainnigStatus = TrainnigStatus.interval;
        _trainningTimeCount = _trainningTime;
        _seriesCount = 1;
        _cyclesCount += 1;
      });
    }
  }

  void trainningToFinish() {
    if (_trainnigStatus == TrainnigStatus.trainning &&
        _trainningTimeCount <= 0 &&
        _cyclesCount >= _totalCyclesAmount &&
        _seriesCount == _totalSeriesAmount) {
      setState(() {
        _trainningTimeCount = _trainningTime;
        _timer?.cancel();
      });
    }
  }

  void intervalToTrainnig() {
    if (_trainnigStatus == TrainnigStatus.interval &&
        _cyclesIntervalTimeCount < 0) {
      setState(() {
        _trainnigStatus = TrainnigStatus.trainning;
        _cyclesIntervalTimeCount = _totalCyclesInterval;
      });
    }
  }

  void restToTrainning() {
    if (_trainnigStatus == TrainnigStatus.rest && _restingTimeCount < 0) {
      setState(() {
        _trainnigStatus = TrainnigStatus.trainning;
        _restingTimeCount = _restingTime;
        _seriesCount += 1;
      });
    }
  }

  void trainningStep() {
    if (_trainnigStatus == TrainnigStatus.trainning) {
      setState(() {
        _trainningTimeCount -= 1;
      });
    }
  }

  void restStep() {
    if (_trainnigStatus == TrainnigStatus.rest) {
      setState(() {
        _restingTimeCount -= 1;
      });
    }
  }

  void intervalStep() {
    if (_trainnigStatus == TrainnigStatus.interval) {
      setState(() {
        _cyclesIntervalTimeCount -= 1;
      });
    }
  }

  double seriesProgress() {
    return (((_cyclesCount - 1) * _totalSeriesAmount) + (_seriesCount)) /
        (_totalCyclesAmount * _totalSeriesAmount);
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
    var info = getStatusViewModel(_trainnigStatus);

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
            firstIcon: info[1],
            circleColor: info[2],
            titleInside: "${info[3]}",
            subtitleInside: info[0],
            seriesCount: '$_seriesCount',
            seriesAmountTotal: '$_totalSeriesAmount',
            progressValue1: info[3] / info[4],
            progressValuer2: seriesProgress(),
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
              GestureDetector(
                onTap: () {
                  _showDialog(
                    const SizedBox(
                      height: 100,
                      width: 100,
                    ),
                  );
                },
                child: const MusicButtons(
                  backGround: "outlined_ellipse",
                  playerIcon: "stop",
                  width: 56,
                  height: 56,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                child: MusicButtons(
                  backGround: "elipse",
                  playerIcon: _isPaused ? "play_black" : "pause",
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
