import 'package:calculator/screens/add_payment.dart';
import 'package:calculator/screens/detail_screen.dart';
import 'package:calculator/screens/shedule.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const LoanScreen()),
              MaterialPageRoute(builder: (context) => const AddPayment()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "Add Payment",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const LoanScreen()),
              MaterialPageRoute(builder: (context) => const ScheduleScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(
              "Schedule",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const LoanScreen()),
              MaterialPageRoute(builder: (context) => const DetailsScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Text(
              "Add Payment",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
