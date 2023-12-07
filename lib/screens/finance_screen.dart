import 'dart:math';
import 'package:calculator/constants/colors.dart';
import 'package:calculator/screens/finance_info.dart';
import 'package:calculator/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  FinanceScreen({super.key});

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
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "FINANZEN",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          itemBuilder: (context, index) {
            // CategoryItem categoryItem = categories.elementAt(index);
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CategoryProducts(
                //       categoryTitle: categoryItem.name,
                //       categoryItems: categoryItem.categoryProduct,
                //     ),
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FincanceInfoscreen(),
                  ),
                );
              },
              child: SafeArea(
                child: Container(
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
                        child: Stack(
                          children: [
                            Positioned(
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
                      Text("GBP/JPY",
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
              ),
              //  ProductsCard(categoryItem: categoryItem),
            );
          },
          itemCount: 20,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            height: 90,
          ),
        ),
      ),
    );
  }
}
