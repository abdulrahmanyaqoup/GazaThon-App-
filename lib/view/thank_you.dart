import 'package:feutric_app/view/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CustomBackgroundPainter(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'يعجز اللسان عن شكرك على ما قدمته لنا',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'لذلك سوف تحصل على عدد من النقاط كمكافأة في مساعدتك في تقييم الأضرار معنا',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'لقد قمت بتقديم 3 صور للأضرار وتم تقديمها بنجاح للفريق المختص وعدد النقاط الخاصة بك هو 3 نقاط',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.star_border, size: 24),
                label: Text(
                  'النقاط',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800020),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
