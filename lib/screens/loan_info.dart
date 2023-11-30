import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/screens/add_payment.dart';
import 'package:calculator/widgets/buttons.dart';
import 'package:calculator/widgets/half_circular_progress_bar.dart';
import 'package:calculator/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoanInfo extends StatelessWidget {
  const LoanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "MORTGAGE INFO",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPayment()),
              );
            },
            icon: SvgPicture.asset(
              AppImages.editIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleWidget(),
              ],
            ),
            const InfoWidget(),
            const SizedBox(height: 30),
            const ButtonsWidget(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(219, 0, 0, 0.02),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Delete Loan",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const HalfCircularProgressBar(
            progress: 0.5,
          ),
        ),
        Positioned(
          bottom: 55,
          child: Text(
            "8 235.23\$",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        Positioned(
          bottom: 35,
          child: Text(
            "Paid",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
