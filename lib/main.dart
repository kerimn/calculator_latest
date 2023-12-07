import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/constants/themes.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:calculator/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MortgageController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taschenrechner',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      color: bgColor,
      home: const InitalPage(),
    );
  }
}

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  _checkIfOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingShown = prefs.getBool('OnBoardingScreenShown') ?? false;
    print(onboardingShown);
    if (!onboardingShown) {
      // Показать ваш экран onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
      prefs.setBool('OnBoardingScreenShown', true);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      _checkIfOnboardingShown();
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.initialPhoto,
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}
