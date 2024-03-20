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
    apiKey: 'AIzaSyAJen4TFlHk-_cTkIxxtiu0D91szYdsKdQ',
    appId: '1:120599335181:web:c6bbb2751084ab3f41e044',
    messagingSenderId: '120599335181',
    projectId: 'presence-8ead1',
    authDomain: 'presence-8ead1.firebaseapp.com',
    storageBucket: 'presence-8ead1.appspot.com',
    measurementId: 'G-L22Q18TXF6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfbviCR811_JgjKb33zhPYzFOVLgzoZgM',
    appId: '1:120599335181:android:bba83e61c75abdf041e044',
    messagingSenderId: '120599335181',
    projectId: 'presence-8ead1',
    storageBucket: 'presence-8ead1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdvXsJCzLb_qOcbTYHeBhaoDh3X1S-Avk',
    appId: '1:120599335181:ios:247ae6a1f27ca3b241e044',
    messagingSenderId: '120599335181',
    projectId: 'presence-8ead1',
    storageBucket: 'presence-8ead1.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdvXsJCzLb_qOcbTYHeBhaoDh3X1S-Avk',
    appId: '1:120599335181:ios:8473bf173f54dc7141e044',
    messagingSenderId: '120599335181',
    projectId: 'presence-8ead1',
    storageBucket: 'presence-8ead1.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}