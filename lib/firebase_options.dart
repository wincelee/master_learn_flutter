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
    apiKey: 'AIzaSyCjOORd-cNpps1i7tVGyM86dWkx7m8z5xI',
    appId: '1:878621507239:web:101fb325febdb6b3f0e582',
    messagingSenderId: '878621507239',
    projectId: 'masterlearn-38eb8',
    authDomain: 'masterlearn-38eb8.firebaseapp.com',
    storageBucket: 'masterlearn-38eb8.appspot.com',
    measurementId: 'G-RR35ZRDY7B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn52Y3KeJd1I2EAGLbtINaVeq05V5xm5Y',
    appId: '1:878621507239:android:6be3c56f81c3f384f0e582',
    messagingSenderId: '878621507239',
    projectId: 'masterlearn-38eb8',
    storageBucket: 'masterlearn-38eb8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVGYC2361SoIi50XhCu_iTX6R75pfMY2Y',
    appId: '1:878621507239:ios:8408ca75e3391a37f0e582',
    messagingSenderId: '878621507239',
    projectId: 'masterlearn-38eb8',
    storageBucket: 'masterlearn-38eb8.appspot.com',
    iosClientId: '878621507239-m6m8fbr1929h8b6qifpgc2p168vu3vo9.apps.googleusercontent.com',
    iosBundleId: 'manu.apps.masterlearn.masterLearn',
  );
}