import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/data/mortgage_model.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:calculator/widgets/buttons.dart';
import 'package:calculator/widgets/half_circular_progress_bar.dart';
import 'package:calculator/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoanInfo extends StatelessWidget {
  const LoanInfo({super.key, required this.mortgageItem});

  final Mortgage mortgageItem;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double paddingTop = (orientation == Orientation.portrait) ? 10 : 120.0;
    var mortgage = context.watch<MortgageController>();

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
          "Hypothekeninformationen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AddPayment()),
              // );
            },
            icon: SvgPicture.asset(
              AppImages.editIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: paddingTop, bottom: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const HalfCircularProgressBar(
                              // progress: mortgage.circleValue(mortgageItem.id),
                              progress: 0.3,
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            child: Text(
                              '${mortgageItem.loan} \$',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            child: Text(
                              "Bezahlt",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InfoWidget(
                  totalAmount: mortgageItem.loan.toString(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: bgColor,
        height: 125,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ButtonsWidget(mortgageID: mortgageItem.id),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(219, 0, 0, 0.02),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    mortgage.deleteMortgage(mortgageItem);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Darlehen löschen",
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
