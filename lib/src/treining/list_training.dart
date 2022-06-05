import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/models/intensity.dart';
import 'package:flutter_app_hackaton/src/models/training.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ListTrainingScreen extends StatefulWidget {
  static const String routeName = "/trainingList";

  const ListTrainingScreen({Key? key}) : super(key: key);

  @override
  State<ListTrainingScreen> createState() => _ListTrainingScreenState();
}

class _ListTrainingScreenState extends State<ListTrainingScreen> {
  late final GetUserTrainingListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetUserTrainingListBloc();
    bloc.add(GetUserTrainingListEvent("time_10"));
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
          List<Training> trainingList = List.empty();
          if (state is SuccessGetUserTrainingListState) {
            trainingList = state.trainingList;
          }
          return Scaffold(
            backgroundColor: CustomColors.mainBackground,
            body: ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: trainingList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = trainingList[index];

                final String iconName;
                final String label;
                final Color color;

                switch (item.intensity) {
                  case Intensity.high:
                    label = "Treino intenso";
                    iconName = "intenso";
                    color = CustomColors.redDark;
                    break;
                  case Intensity.mid:
                    label = "Treino moderado";
                    iconName = "moderado";
                    color = CustomColors.primaryPurpleDark;
                    break;
                  default:
                    label = "Treino leve";
                    iconName = "leve";
                    color = CustomColors.greenDark;
                }

                return ListTile(
                  title: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    item.comment,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        SvgPicture.asset("assets/images/icons/$iconName.svg"),
                  ),
                  onTap: null,
                );
              },
            ),
          );
        });
  }
}
