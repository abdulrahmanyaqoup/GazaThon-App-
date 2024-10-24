import 'package:feutric_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Color(0xFF800020)),
        primaryColor: const Color(0xFF800020),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF800020),
        ),
      ),
      title: 'Gazathon',
      home: const SplashScreen(),
    );
  }
}
