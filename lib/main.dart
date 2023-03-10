import 'package:flutter/material.dart';
import 'package:halalbee/pages/home.dart';
import 'package:halalbee/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'firebase_options.dart';

// main.dart is always the file that executed first

// Main application launch function
Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// MyApp launch and setting the theme for project
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // setting Home page
      home: LoaderOverlay(child: Login()),
    );
  }
}