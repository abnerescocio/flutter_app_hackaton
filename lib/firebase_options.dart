import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCTYERryr3gcswcN5_Gzxyj7HuOqY_5hbI',
    appId: '1:576138160890:web:98b256ea0289dae14c7743',
    messagingSenderId: '576138160890',
    projectId: 'flutter-app-hackathon',
    authDomain: 'flutter-app-hackathon.firebaseapp.com',
    storageBucket: 'flutter-app-hackathon.appspot.com',
    measurementId: 'G-7QD1PJ5059',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD72WN9qQpPwPaVFIDjp-eDOd5BCul66L0',
    appId: '1:576138160890:android:7a96bcb3fb9acde34c7743',
    messagingSenderId: '576138160890',
    projectId: 'flutter-app-hackathon',
    storageBucket: 'flutter-app-hackathon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM8HPyur5DTNAbj0jwfmxuf_BTziNWYfg',
    appId: '1:576138160890:ios:e99b6dd64a83ba524c7743',
    messagingSenderId: '576138160890',
    projectId: 'flutter-app-hackathon',
    storageBucket: 'flutter-app-hackathon.appspot.com',
    iosClientId:
        '576138160890-f95ajdkfqg4un4730amp2fvoomkp5oqh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppHackaton',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAM8HPyur5DTNAbj0jwfmxuf_BTziNWYfg',
    appId: '1:576138160890:ios:e99b6dd64a83ba524c7743',
    messagingSenderId: '576138160890',
    projectId: 'flutter-app-hackathon',
    storageBucket: 'flutter-app-hackathon.appspot.com',
    iosClientId:
        '576138160890-f95ajdkfqg4un4730amp2fvoomkp5oqh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppHackaton',
  );
}
