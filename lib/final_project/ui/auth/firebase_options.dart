// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6CilZnr6EJk891rn_-c8V7jzZQ8JKblU',
    appId: '1:355637488570:android:f95e36e9a8735055b40b83',
    messagingSenderId: '355637488570',
    projectId: 'capstone2-86479',
    storageBucket: 'capstone2-86479.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhqpy1BG8Q1Mc7gfOedNdhzuk28wV8uWw',
    appId: '1:355637488570:ios:dbf737d76c3e7f0db40b83',
    messagingSenderId: '355637488570',
    projectId: 'capstone2-86479',
    storageBucket: 'capstone2-86479.appspot.com',
    iosBundleId: 'com.example.flutterAuth',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAF4nV2MLprIvArQDcr8fFDbOmvnBnBAf4',
    appId: '1:355637488570:web:f35c7ec582387bd1b40b83',
    messagingSenderId: '355637488570',
    projectId: 'capstone2-86479',
    authDomain: 'capstone2-86479.firebaseapp.com',
    storageBucket: 'capstone2-86479.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhqpy1BG8Q1Mc7gfOedNdhzuk28wV8uWw',
    appId: '1:355637488570:ios:dbf737d76c3e7f0db40b83',
    messagingSenderId: '355637488570',
    projectId: 'capstone2-86479',
    storageBucket: 'capstone2-86479.appspot.com',
    iosBundleId: 'com.example.flutterAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAF4nV2MLprIvArQDcr8fFDbOmvnBnBAf4',
    appId: '1:355637488570:web:a5958c080dea3f03b40b83',
    messagingSenderId: '355637488570',
    projectId: 'capstone2-86479',
    authDomain: 'capstone2-86479.firebaseapp.com',
    storageBucket: 'capstone2-86479.appspot.com',
  );

}