import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:calculator/screens/home_full_screen.dart';
import 'package:calculator/widgets/custom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mortgage = context.watch<MortgageController>();
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
          "ADD MORTAGE",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   // MaterialPageRoute(builder: (context) => const LoanScreen()),
              //   // MaterialPageRoute(builder: (context) => const HomeDataScreen()),
              // );
            },
            icon: SvgPicture.asset(
              AppImages.settingsIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                title: "Title",
                onChanged: (value) {
                  mortgage.updateNameFieldValue(value);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        title: "Amount",
                        onChanged: (value) {
                          mortgage.updateLoanFieldValue(value);
                        }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      title: "Rate",
                      onChanged: (value) {
                        mortgage.updatePercentageFieldValue(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: "Term",
                      onChanged: (value) {
                        mortgage.updateMonthFieldValue(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      title: "First Payment",
                      onChanged: (value) {
                        mortgage.updateFirstPaymentValue(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                "Payment type",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
              const CustomTabWidget(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 312.0,
                    maxHeight: 62.0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      mortgage.addMortgage();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'ADD LOAN',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 13,
                            color: bgColor,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String title;

  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: borderColor, fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 16),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
