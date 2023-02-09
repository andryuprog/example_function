import 'package:flutter/material.dart';
import 'package:my_calculate/screens/history/weather_screen.dart';
import 'screens/calc/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my calculate',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.black87,
          ),
          // secondary:  Color.red,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => CalculatorApp(),
          '/two_pages': (context) => TwoPages(),
        });
  }
}



