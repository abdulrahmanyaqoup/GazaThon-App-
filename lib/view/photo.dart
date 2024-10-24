import 'package:feutric_app/view/painter.dart';
import 'package:feutric_app/view/thank_you.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImageWithCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text(
                    'قبل البدء يجب اتباع الإرشادات التالية',
                    style: GoogleFonts.rubik(
                      color: const Color(0xFF800020),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'اضغط على الزر لالتقاط صورة أو اختيار صورة من معرض الصور',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  'سيتم استخدام الصورة لتحديد موقع الضرر وتقديم المساعدة',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  'لا تقم بتصوير الاشخاص او الاماكن الخاصة',
                  style: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: _pickImageFromGallery,
                      backgroundColor: const Color(0xFF800020),
                      child: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                    ),
                    // Capture from Camera button
                    FloatingActionButton(
                      onPressed: _captureImageWithCamera,
                      backgroundColor: const Color(0xFF800020),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                          'لا توجد صورة محددة او ملتقطة',
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF008080),
        child: const Icon(Icons.directions),
      ),
    );
  }
}
