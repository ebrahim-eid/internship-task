import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_task/screens/subject_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness:
          Brightness.light, // Dark == white status bar icons -- for Android.
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubjectsScreen(),
    );
  }
}
