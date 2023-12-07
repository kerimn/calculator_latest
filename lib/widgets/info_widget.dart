import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.totalAmount});
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Aktuelle Zahlung",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "631.53\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gesamtkreditbetrag",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "$totalAmount\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 1,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bezahlte Zinsen",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "0\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Verbleibendes Interesse",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "156.81\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gesamtkreditbetrag",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "156.81\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 1,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Völlig kostenlos",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "0\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gesamtversicherung",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "0\$",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, color: mainColor),
            ),
          ],
        ),
      ],
    );
  }
}
