import 'package:flutter/material.dart';
import 'package:flutter_app_hackaton/src/blocs/app_blocs.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';

import '../settings/settings_view.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  late final GetUserBloc getUserBloc;

  @override
  void initState() {
    super.initState();
    getUserBloc = GetUserBloc();
    getUserBloc.add(GetUserEvent("time_10"));
  }

  @override
  void dispose() {
    super.dispose();
    getUserBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GetUserState>(
        stream: getUserBloc.stream,
        builder: (context, AsyncSnapshot<GetUserState> snapshot) {
          final items = ["Teste", "Teste", "Teste"];
          return Scaffold(
            appBar: AppBar(
              title: Text(
                snapshot.data?.toString() ?? "Falhou",
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),

            // To work with lists that may contain a large number of items, it’s best
            // to use the ListView.builder constructor.
            //
            // In contrast to the default ListView constructor, which requires
            // building all Widgets up front, the ListView.builder constructor lazily
            // builds Widgets as they’re scrolled into view.
            body: ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'sampleItemListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ListTile(
                    title: Text('SampleItem $item'),
                    leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      foregroundImage:
                          AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {
                      // Navigate to the details page. If the user leaves and returns to
                      // the app after it has been killed while running in the
                      // background, the navigation stack is restored.
                      Navigator.restorablePushNamed(
                        context,
                        SampleItemDetailsView.routeName,
                      );
                    });
              },
            ),
          );
        });
  }
}
