import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/models/training.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            body: ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: trainingList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = trainingList[index];

                return ListTile(
                  title: Text('SampleItem $item'),
                  leading: const CircleAvatar(
                    // Display the Flutter Logo image asset.
                    foregroundImage:
                        AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: null,
                );
              },
            ),
          );
        });
  }
}
