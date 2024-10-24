import 'package:feutric_app/view/dashboard.dart';
import 'package:feutric_app/view/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for the text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Password visibility toggle
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  // List of options for the dropdown
  final List<String> _filterOptions = [
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

  // Selected option variable (initial value is 'Abood')
  String _selectedOption = 'المنطقة';

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
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
                    ),
                    DropdownButton<String>(
                      value: _selectedOption,
                      menuMaxHeight: 200,
                      underline: const SizedBox.shrink(),
                      dropdownColor: const Color(0xFF800020), // Dropdown color
                      iconEnabledColor: const Color(0xFF800020), // Arrow color
                      style: GoogleFonts.rubik(
                        color: const Color(0xFF800020),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      items: _filterOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Center(
                            child: Text(
                              option,
                              style: GoogleFonts.rubik(
                                color: _selectedOption == option
                                    ? const Color(0xFF800020)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue ?? 'المنطقة';
                        });
                      },
                    ),
                    const SizedBox(height: 80),
                    _buildRoundedTextField(
                      controller: _usernameController,
                      hintText: 'اسم المستخدم',
                      isPassword: false,
                    ),
                    const SizedBox(height: 50),
                    _buildRoundedTextField(
                      controller: _passwordController,
                      hintText: 'كلمة المرور',
                      isPassword: true,
                      isPasswordVisible: _isPasswordHidden,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    _buildRoundedTextField(
                      controller: _confirmPasswordController,
                      hintText: 'تأكيد كلمة المرور',
                      isPassword: true,
                      isPasswordVisible: _isConfirmPasswordHidden,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
                        });
                      },
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800020),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        '     تسجيل الدخول       ',
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool isPasswordVisible = true,
    VoidCallback? onTogglePasswordVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: controller,
        obscureText: isPassword ? isPasswordVisible : false,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF800020)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF800020), width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF800020), width: 4),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: onTogglePasswordVisibility,
                )
              : null,
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
