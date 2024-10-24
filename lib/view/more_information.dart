import 'package:feutric_app/view/painter.dart';
import 'package:feutric_app/view/photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInformation extends StatefulWidget {
  const MoreInformation({super.key});

  @override
  _MoreInformationState createState() => _MoreInformationState();
}

class _MoreInformationState extends State<MoreInformation> {
  // Define the options and selected values for each dropdown
  final List<String> _options1 = [
    'المنطقة',
    'أم النصر',
    'بيت لاهيا',
    'بيت حانون',
    'جباليا',
    'الشجاعية',
    'النصيرات',
    'البريج',
    'المغازي',
    'دير البلح',
    'خان يونس',
    'رفح',
    'خزاعة',
    'القرارة',
    'المغراقة',
    'بني سهيلا'
  ];
  String _selectedOption1 = 'المنطقة';

  final List<String> _options2 = [
    'الحي السكني',
    'حي الدرج',
    'حي الزيتون',
    'الشيخ رضوان',
    'تل الهوى',
    'تل المنطار',
    'الشيخ عجلين',
    'تل السلطان',
    'جحر الديك'
  ];
  String _selectedOption2 = 'الحي السكني';

  final List<String> _options3 = [
    'اسم الشارع',
    'شارع عمر المختار',
    'شارع الثلاثيني',
    'شارع الثورة',
    'شارع صلاح الدين',
    'شارع النفق',
    'شارع تل السلطان',
    'شارع فهمي بيك'
  ];
  String _selectedOption3 = 'اسم الشارع';

  final List<String> _options4 = [
    'نوع المنشأة',
    'منشأة سكنية',
    'منشأة ترفيهية',
    'منشأة طبية',
    'منشأة تعليمية',
    'منشأة تجارية',
    'منشأة حكومية',
    'منشأة زراعية',
    'منشأة صناعية',
    'منشأة خدمية',
    'منشأة أخرى'
  ];
  String _selectedOption4 = 'نوع المنشأة';

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
                buildDropdown(_options1, _selectedOption1, (String? newValue) {
                  setState(() {
                    _selectedOption1 = newValue ?? _options1.first;
                  });
                }),
                const SizedBox(height: 60), // Spacing between dropdowns
                buildDropdown(_options2, _selectedOption2, (String? newValue) {
                  setState(() {
                    _selectedOption2 = newValue ?? _options2.first;
                  });
                }),
                const SizedBox(height: 60),
                buildDropdown(_options3, _selectedOption3, (String? newValue) {
                  setState(() {
                    _selectedOption3 = newValue ?? _options3.first;
                  });
                }),
                const SizedBox(height: 60),
                buildDropdown(_options4, _selectedOption4, (String? newValue) {
                  setState(() {
                    _selectedOption4 = newValue ?? _options4.first;
                  });
                }),
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
              builder: (context) => const TakePhoto(),
            ),
          );
        },
        backgroundColor: const Color(0xFF008080),
        child: const Icon(Icons.directions),
      ),
    );
  }

  // Function to build the dropdown
  Widget buildDropdown(List<String> options, String selectedOption,
      ValueChanged<String?> onChanged) {
    return Center(
      child: DropdownButton<String>(
        value: selectedOption,
        menuMaxHeight: 200,
        underline: const SizedBox.shrink(),
        dropdownColor: const Color(0xFF800020), // Dropdown color
        iconEnabledColor: const Color(0xFF800020), // Arrow color
        style: GoogleFonts.rubik(
          color: const Color(0xFF800020),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Center(
              child: Text(
                option,
                style: GoogleFonts.rubik(
                  color: selectedOption == option
                      ? const Color(0xFF800020)
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
