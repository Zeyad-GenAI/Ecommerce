import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Shop Now",
          body: "Discover your favorites and shop with ease 🛍️✨",
          image: Image.asset('assets/images/splash-1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Big Discount",
          body:
          "Hurry Big discounts on everything—shop now and save before they're gone 🔥💸",
          image: Image.asset('assets/images/splash-2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Free Delivery",
          body:
          "Enjoy FREE delivery on all orders Shop now and get your favorites delivered to your door with no extra cost 🛍️✨",
          image: Image.asset('assets/images/splash-3.png'),
          decoration: pageDecoration,
        ),
      ],
      onChange: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      showBackButton: true,
      back: Text(
        'Back',
        style: TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      next: Text(
        'Next',
        style: TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      showDoneButton: true,
      done: Text(
        'Get Started',
        style: TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Colors.cyan,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}