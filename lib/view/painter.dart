import 'package:flutter/material.dart';

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient colors
    const Gradient gradient = LinearGradient(
      colors: [
        const Color(0xFF008080), // const Color(0xFF008080) color at the top
        Color(0xFF800020), // Deep red color at the bottom
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Create a paint object with a gradient
    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Draw the top wave
    Path topPath = Path();
    topPath.lineTo(0, size.height * 0.2); // Line to the start of the wave
    topPath.quadraticBezierTo(size.width * 0.25, size.height * 0.3,
        size.width * 0.5, size.height * 0.2); // First curve
    topPath.quadraticBezierTo(size.width * 0.75, size.height * 0.1, size.width,
        size.height * 0.2); // Second curve
    topPath.lineTo(size.width, 0); // Line to the top right corner
    topPath.close(); // Close the path to the top left corner
    canvas.drawPath(topPath, paint);

    // Draw the bottom wave (inverted)
    Path bottomPath = Path();
    bottomPath.moveTo(0, size.height);
    bottomPath.lineTo(0, size.height * 0.8); // Line to the start of the wave
    bottomPath.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8); // First curve
    bottomPath.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width, size.height * 0.8); // Second curve
    bottomPath.lineTo(
        size.width, size.height); // Line to the bottom right corner
    bottomPath.close(); // Close the path to the bottom left corner
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
