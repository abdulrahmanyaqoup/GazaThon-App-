import 'package:feutric_app/view/login_screen.dart';
import 'package:feutric_app/view/map_screen.dart';
import 'package:feutric_app/view/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CustomBackgroundPainter(),
          ),
          Positioned.fill(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Positioned(
                  child: Center(
                    child: Text(
                      'اهلا فيك في تطبيق اعمار',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF800020),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'خطوة بخطوة رح نعمرها \nوغزة رح ترجع احلى ',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF800020),
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 100), // Spacing between text and buttons
                // Button 1
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080), // Button color
                    foregroundColor: const Color(0xFF800020), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'مواطن',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 80), // Spacing between buttons
                // Button 2
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080), // Button color
                    foregroundColor: const Color(0xFF800020), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'مهندس',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Image(
                  image: AssetImage('assets/images/ssss.png'),
                  height: 150,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
