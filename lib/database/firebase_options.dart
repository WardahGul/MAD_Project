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
    apiKey: 'AIzaSyAsIaW2ZtKXkY2MlOyw3u0WPbTq1OmM0AY',
    appId: '1:555949557523:web:f257d8d4b2a683e7d47ce6',
    messagingSenderId: '555949557523',
    projectId: 'fyp-firebase-fca88',
    authDomain: 'fyp-firebase-fca88.firebaseapp.com',
    storageBucket: 'fyp-firebase-fca88.appspot.com',
    measurementId: 'G-DV75JHLH0V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALs60Lc2ErYISZ8QzigADI4b-85EMKhXo',
    appId: '1:555949557523:android:01dca50e8268faa7d47ce6',
    messagingSenderId: '555949557523',
    projectId: 'fyp-firebase-fca88',
    storageBucket: 'fyp-firebase-fca88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-3LJc3K5IEBgXxaCQ18CcSd3SXFQXA_I',
    appId: '1:555949557523:ios:4ccec8939f17d232d47ce6',
    messagingSenderId: '555949557523',
    projectId: 'fyp-firebase-fca88',
    storageBucket: 'fyp-firebase-fca88.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-3LJc3K5IEBgXxaCQ18CcSd3SXFQXA_I',
    appId: '1:555949557523:ios:c70f9e9e764bf269d47ce6',
    messagingSenderId: '555949557523',
    projectId: 'fyp-firebase-fca88',
    storageBucket: 'fyp-firebase-fca88.appspot.com',
    iosBundleId: 'com.example.finalProject.RunnerTests',
  );
}
