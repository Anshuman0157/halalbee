import 'package:flutter/material.dart';
import 'package:halalbee/pages/home.dart';

// main.dart is always the file that executed first

// Main application launch function
void main() {
  runApp(const MyApp());
}

// MyApp launch and setting the theme for project
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // setting Home page
      home: const Home(),
    );
  }
}