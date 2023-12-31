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
    apiKey: 'AIzaSyCYobIE8yQgKseIQTNRqIbGRkmIRPNg3nw',
    appId: '1:724901402381:web:44a520d9e3e74cb117c244',
    messagingSenderId: '724901402381',
    projectId: 'coffeeshop-app-94770',
    authDomain: 'coffeeshop-app-94770.firebaseapp.com',
    storageBucket: 'coffeeshop-app-94770.appspot.com',
    measurementId: 'G-R5EGWQEL0S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARL8_ckeD6GGEkQxC-T23oWc-mLAjNZlY',
    appId: '1:724901402381:android:cc10dc3f0c530b7417c244',
    messagingSenderId: '724901402381',
    projectId: 'coffeeshop-app-94770',
    storageBucket: 'coffeeshop-app-94770.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiBAayLkQpOMLQPmWgW7J-wLOeZy5yo40',
    appId: '1:724901402381:ios:f3238bcc703a282c17c244',
    messagingSenderId: '724901402381',
    projectId: 'coffeeshop-app-94770',
    storageBucket: 'coffeeshop-app-94770.appspot.com',
    iosBundleId: 'com.example.coffeshopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiBAayLkQpOMLQPmWgW7J-wLOeZy5yo40',
    appId: '1:724901402381:ios:ec070edad43f151e17c244',
    messagingSenderId: '724901402381',
    projectId: 'coffeeshop-app-94770',
    storageBucket: 'coffeeshop-app-94770.appspot.com',
    iosBundleId: 'com.example.coffeshopApp.RunnerTests',
  );
}
