import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/technical.dart';
import 'screens/physical.dart';
import 'screens/ask_coach.dart';
import 'screens/progress.dart';

void main() {
  runApp(TrainSmartApp());
}

class TrainSmartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrainSmart Football',
      theme: ThemeData(
        primaryColor: Color(0xFF4B4B4B),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF00C853)),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/technical': (context) => TechnicalScreen(),
        '/physical': (context) => PhysicalScreen(),
        '/ask': (context) => AskCoachScreen(),
        '/progress': (context) => ProgressScreen(),
      },
    );
  }
}