import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TabBar(
                  unselectedLabelColor: bgColor,
                  labelColor: mainColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: mainColor,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "ANNUITY",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 11),
                      ),
                    ),
                    Tab(
                        child: Text(
                      'DIFFERENTIAL',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    )),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: SizedBox()),
              Center(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
