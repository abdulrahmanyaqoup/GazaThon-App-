import 'dart:async';

import 'package:feutric_app/view/welcoming.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF800020),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Replace with your app's logo asset
            const Image(
              image: AssetImage('assets/images/black.png'),
              height: 150,
            ),
            const SizedBox(height: 20),
            // App name
            Text(
              'إعمار',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF008080),
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
