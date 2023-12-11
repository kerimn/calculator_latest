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
                      // zdes napisany customnye stili
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "RENTE",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 11),
                        ),
                      ),
                    ),
                    Tab(
                      // zdes napisany customnye stili
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'DIFFERENTIAL',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const SafeArea(
            child: TabBarView(
              children: [
                Center(child: SizedBox()),
                Center(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
