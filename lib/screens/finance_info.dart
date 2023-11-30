import 'dart:math';

import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FincanceInfoscreen extends StatelessWidget {
  const FincanceInfoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leadingWidth: 40,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AppImages.left,
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FINANCE INFO",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              flex: 6,
              child: ChartWidget(),
            ),
            const SizedBox(height: 35),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FinanceCardWidget(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FinanceCardWidget(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: FinanceCardWidget(),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FinanceCardWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinanceCardWidget extends StatelessWidget {
  FinanceCardWidget({
    super.key,
  });

  var flags = [
    "assets/img/can.png",
    "assets/img/eng.png",
    "assets/img/flag.png",
    "assets/img/flag2.png",
    "assets/img/jap.png",
    "assets/img/usa.png",
  ];
  String getRandomFlag() {
    final random = Random();
    return flags[random.nextInt(flags.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFDDDDDD),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 38,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      getRandomFlag(),
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      getRandomFlag(),
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text("GBPJPY", style: Theme.of(context).textTheme.titleMedium)
        ],
      ),
    );
  }
}
