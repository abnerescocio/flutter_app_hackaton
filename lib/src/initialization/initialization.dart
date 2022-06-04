import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

class InitializerNotifier extends ChangeNotifier {
  InitializerNotifier() {
    _init();
  }

  void _init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    notifyListeners();
  }
}
