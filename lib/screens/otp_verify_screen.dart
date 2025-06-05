import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final Color accentPurpleColor = Color(0xFF6A53A1);
  final Color primaryColor = Color(0xFF121212);
  final Color accentPinkColor = Color(0xFFF99BBD);
  final Color accentDarkGreenColor = Color(0xFF115C49);
  final Color accentYellowColor = Color(0xFFFFB612);
  final Color accentOrangeColor = Color(0xFFEA7A3B);

  late List<TextStyle?> otpTextStyles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
      createStyle(accentPinkColor),
      createStyle(accentPurpleColor),
    ];
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.displaySmall?.copyWith(color: color, fontSize: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter the OTP we have sent you to your number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 30),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: accentPurpleColor,
                  focusedBorderColor: accentPurpleColor,
                  styles: otpTextStyles,
                  showFieldAsBox: true,
                  borderWidth: 4.0,
                  fieldWidth: 50,
                  textStyle: TextStyle(fontSize: 24),
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode) {
                    if (verificationCode.length == 6) {
                      // Navigator.pushNamed(context, '/recovery');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid OTP')),
                      );
                    }
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // This button can be optional since OtpTextField has onSubmit
                    // But keeping it for consistency with previous screens
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}