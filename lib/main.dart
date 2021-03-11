import 'package:flutter/material.dart';
import 'package:weather_app/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather Tracker',
      home: Homescreen(),
    );
  }
}
