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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAEqm0pcd9veps61372j1Rhw14X58bsjcE',
    appId: '1:638083977136:web:481f808b81bf2de9a11075',
    messagingSenderId: '638083977136',
    projectId: 'biblioteca-1ea67',
    authDomain: 'biblioteca-1ea67.firebaseapp.com',
    storageBucket: 'biblioteca-1ea67.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu6BMiDZNu6wL-gXTdZZ804SEiiK2fBqY',
    appId: '1:638083977136:android:c508228ff258be66a11075',
    messagingSenderId: '638083977136',
    projectId: 'biblioteca-1ea67',
    storageBucket: 'biblioteca-1ea67.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeC_2EDddwahYn0zbZdSYQjjqBxjYlQnQ',
    appId: '1:638083977136:ios:85915036efdcc1f2a11075',
    messagingSenderId: '638083977136',
    projectId: 'biblioteca-1ea67',
    storageBucket: 'biblioteca-1ea67.firebasestorage.app',
    iosBundleId: 'com.example.biblioteca',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeC_2EDddwahYn0zbZdSYQjjqBxjYlQnQ',
    appId: '1:638083977136:ios:85915036efdcc1f2a11075',
    messagingSenderId: '638083977136',
    projectId: 'biblioteca-1ea67',
    storageBucket: 'biblioteca-1ea67.firebasestorage.app',
    iosBundleId: 'com.example.biblioteca',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAEqm0pcd9veps61372j1Rhw14X58bsjcE',
    appId: '1:638083977136:web:4e49c9ea865207c6a11075',
    messagingSenderId: '638083977136',
    projectId: 'biblioteca-1ea67',
    authDomain: 'biblioteca-1ea67.firebaseapp.com',
    storageBucket: 'biblioteca-1ea67.firebasestorage.app',
  );
}
