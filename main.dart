// main.dart
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'done_screen.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Times New Roman',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18),
          bodyLarge: TextStyle(fontSize: 16),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Times New Roman',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18),
          bodyLarge: TextStyle(fontSize: 16),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}