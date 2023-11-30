import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/constants/themes.dart';
import 'package:calculator/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      color: bgColor,
      home: const InitalPage(),
    );
  }
}

class InitalPage extends StatelessWidget {
  const InitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
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
