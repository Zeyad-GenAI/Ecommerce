import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/onboarding_screen.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primaryColor: Constant.primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

