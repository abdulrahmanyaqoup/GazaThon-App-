import 'package:feutric_app/view/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageDetailedPage extends StatefulWidget {
  const ImageDetailedPage({super.key});

  @override
  _ImageDetailedPageState createState() => _ImageDetailedPageState();
}

class _ImageDetailedPageState extends State<ImageDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomPaint(
          size: MediaQuery.of(context).size,
          painter: CustomBackgroundPainter(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            // Image widget
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/1.jpg', // Placeholder image from the web
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Second Lorem text
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'من خلال التقييم الذي أجريناه في المنطقة  تبين أن الأضرار الرئيسية تتمثل في تضرر البناية بنسبة 80%، مما يؤثر بشكل مباشر على حياة 10 اشخاص. نوصي ببدء الإصلاح في هذه المنطقة بشكل فوري لضمان رجوع اهالي البيت الى منزلهم، ونقترح الاستعانة بـ 3 فرق متخصصة خلال الأيام الثلاثة القادمة، مع توفير الموارد اللازمة مثل أنابيب المياه وآلات الحفر.',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'اعتماد المهندس',
              style: GoogleFonts.rubik(
                color: const Color(0xFF008080),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080), // Button color
                    foregroundColor: const Color(0xFF800020), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'تأكيد التقييم',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF800020),
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080), // Button color
                    foregroundColor: const Color(0xFF800020), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'تعديل التقييم',
                    style: GoogleFonts.rubik(
                      color: const Color(0xFF800020),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
