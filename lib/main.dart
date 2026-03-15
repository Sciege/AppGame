import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_form/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Special case since were using web/linux
  // Firebase Configuration for Web/Linux (Extracted from google-services.json)
  const firebaseOptions = FirebaseOptions(
    apiKey: 'AIzaSyChYXypM_0QSFE8fvqJUrsi1GAA82TMy6U',
    appId: '1:827628718390:android:28ea807f7047815a7a8b97', // Using Android ID as fallback
    messagingSenderId: '827628718390',
    projectId: 'qr-verse',
    storageBucket: 'qr-verse.firebasestorage.app',
  );

  try {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
    debugPrint('Firebase initialized successfully');
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}
