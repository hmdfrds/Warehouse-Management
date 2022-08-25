// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDSUglZ-KFny2vGSwBBmCDf0KqGZe_LCgk',
    appId: '1:904624647910:web:6b9deec810af146d51d527',
    messagingSenderId: '904624647910',
    projectId: 'warehouse-3c379',
    authDomain: 'warehouse-3c379.firebaseapp.com',
    storageBucket: 'warehouse-3c379.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDemsrMqGmBoppXjo6z8XrTOMZKpM1O1Y8',
    appId: '1:904624647910:android:cf88511657489e8f51d527',
    messagingSenderId: '904624647910',
    projectId: 'warehouse-3c379',
    storageBucket: 'warehouse-3c379.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB17aJXWTtYdortLx4B4fdOgiIlgEicCzI',
    appId: '1:904624647910:ios:89cf5e7d0f3a194f51d527',
    messagingSenderId: '904624647910',
    projectId: 'warehouse-3c379',
    storageBucket: 'warehouse-3c379.appspot.com',
    iosClientId: '904624647910-f448a0dm1sv9r69ma0vp6kqlso9en33m.apps.googleusercontent.com',
    iosBundleId: 'com.example.warehouse',
  );
}