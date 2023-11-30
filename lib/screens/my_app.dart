import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/screens/finance_screen.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:calculator/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  int currentIndex = 0;
  var pages = [
    const HomeScreen(),
    FinanceScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  AppImages.trade,
                  color: currentIndex == 0 ? mainColor : Colors.grey,
                ),
              ),
              label: 'MORTGAGE',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  AppImages.trade,
                  color: currentIndex == 1 ? mainColor : Colors.grey,
                ),
              ),
              label: 'FINANCE',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(AppImages.settings,
                    color: currentIndex == 2 ? mainColor : Colors.grey),
              ),
              label: 'SETTINGS',
            ),
          ],
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey),
    );
  }
}
