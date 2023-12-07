import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:calculator/widgets/custom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          "Hypothek hinzufügen",
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
              TextField(
                onChanged: (value) {
                  mortgage.updateNameFieldValue(value);
                },
                decoration: InputDecoration(
                  hintText: "Titel",
                  hintStyle: TextStyle(color: borderColor, fontSize: 12),
                  contentPadding: const EdgeInsets.only(left: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        mortgage.updateLoanFieldValue(value);
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Menge",
                        hintStyle: TextStyle(color: borderColor, fontSize: 12),
                        contentPadding: const EdgeInsets.only(left: 16),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        mortgage.updatePercentageFieldValue(value);
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Rate",
                        hintStyle: TextStyle(color: borderColor, fontSize: 12),
                        contentPadding: const EdgeInsets.only(left: 16),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        mortgage.updateMonthFieldValue(value);
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Begriff",
                        hintStyle: TextStyle(color: borderColor, fontSize: 12),
                        contentPadding: const EdgeInsets.only(left: 16),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        mortgage.updateFirstPaymentValue(value);
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Erste Zahlung",
                        hintStyle: TextStyle(color: borderColor, fontSize: 12),
                        contentPadding: const EdgeInsets.only(left: 16),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                "Zahlungsart",
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
                      'Darlehen hinzufügen',
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
