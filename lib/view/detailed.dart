import 'package:feutric_app/view/image_detailed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  // List of records for houses with coordinates, image, and damage percentage
  final List<Map<String, dynamic>> houseData = [
    {
      'coords': '31.5, 34.4667',
      'image': 'assets/images/1.jpg',
      'damage': '80%'
    },
    {
      'coords': '31.6, 34.4670',
      'image': 'assets/images/2.jpeg',
      'damage': '60%'
    },
    {
      'coords': '31.7, 34.4675',
      'image': 'assets/images/3.jpeg',
      'damage': '40%'
    },
    {
      'coords': '31.8, 34.4680',
      'image': 'assets/images/4.jpeg',
      'damage': '72%'
    },
    {
      'coords': '31.9, 34.4685',
      'image': 'assets/images/1.jpg',
      'damage': '88%'
    },
    {
      'coords': '32.0, 34.4690',
      'image': 'assets/images/2.jpeg',
      'damage': '30%'
    },
    {
      'coords': '32.1, 34.4695',
      'image': 'assets/images/3.jpeg',
      'damage': '45%'
    },
    {
      'coords': '32.2, 34.4700',
      'image': 'assets/images/4.jpeg',
      'damage': '85%'
    },
    {
      'coords': '32.3, 34.4705',
      'image': 'assets/images/1.jpg',
      'damage': '92%'
    },
    {
      'coords': '32.4, 34.4710',
      'image': 'assets/images/2.jpeg',
      'damage': '55%'
    },
    {
      'coords': '31.9, 34.4685',
      'image': 'assets/images/1.jpg',
      'damage': '88%'
    },
    {
      'coords': '32.0, 34.4690',
      'image': 'assets/images/2.jpeg',
      'damage': '30%'
    },
    {
      'coords': '32.1, 34.4695',
      'image': 'assets/images/3.jpeg',
      'damage': '45%'
    },
    {
      'coords': '32.2, 34.4700',
      'image': 'assets/images/4.jpeg',
      'damage': '85%'
    },
    {
      'coords': '31.9, 34.4685',
      'image': 'assets/images/1.jpg',
      'damage': '88%'
    },
    {
      'coords': '32.0, 34.4690',
      'image': 'assets/images/2.jpeg',
      'damage': '30%'
    },
    {
      'coords': '32.1, 34.4695',
      'image': 'assets/images/3.jpeg',
      'damage': '45%'
    },
    {
      'coords': '32.2, 34.4700',
      'image': 'assets/images/4.jpeg',
      'damage': '85%'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'منشأة سكنية',
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF800020),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: houseData.length,
        itemBuilder: (context, index) {
          final house = houseData[index];
          return ListTile(
            leading: Image.asset(
              house[
                  'image'], // Display house image (replace with actual image path)
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text('الاحداثيات: ${house['coords']}'),
            subtitle: Text('نسبة الدمار : ${house['damage']}'),
            trailing: const Icon(
              Icons.location_on,
              color: Color(0xFF800020),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImageDetailedPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
