import 'package:calculator/screens/add_payment.dart';
import 'package:calculator/screens/detail_screen.dart';
import 'package:calculator/screens/shedule.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ButtonsWidget extends StatelessWidget {
  ButtonsWidget({
    super.key,
    required this.mortgageID,
  });

  int mortgageID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                // MaterialPageRoute(builder: (context) => const LoanScreen()),
                MaterialPageRoute(
                  builder: (context) => AddPayment(
                    mortgageID: mortgageID,
                  ),
                ),
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
                "Zahlung hinzufügen",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: InkWell(
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
                "Zeitplan",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: InkWell(
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
                "Einzelheiten",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
