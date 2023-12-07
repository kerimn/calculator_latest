import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/data/mortgage_model.dart';
import 'package:calculator/data/payment.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:calculator/screens/add_loan.dart';
import 'package:calculator/screens/loan_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mortgage = context.watch<MortgageController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "IHRE HYPOTHEKEN",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mortgage.items.isEmpty
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoanScreen()),
                        );
                      },
                      child: DottedBorder(
                        color: Colors.grey,
                        dashPattern: const [10, 10, 10, 10],
                        strokeWidth: 0.8,
                        radius: const Radius.circular(11),
                        borderType: BorderType.RRect,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 27,
                                height: 27,
                                child: Container(
                                  padding: const EdgeInsets.all(4.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey,
                                  ),
                                  child: SvgPicture.asset(AppImages.add),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hypothekeninformationen hinzufügen",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontSize: 13),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      'Fügen Sie Informationen zu Ihrer Hypothek hinzu,\n indem Sie auf die Schaltfläche „Darlehen hinzufügen“ klicken',
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: ListView.separated(
                        itemCount: mortgage.items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Mortgage mortgageItem =
                              mortgage.items.elementAt(index);
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (index == 0)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoanScreen()),
                                    );
                                  },
                                  child: Container(
                                    height: 125,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppImages.add,
                                        width: 18,
                                        height: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 11),
                              GestureDetector(
                                onTap: () {
                                  print(mortgageItem.id);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoanInfo(
                                        mortgageItem: mortgageItem,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: bgColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        mortgageItem.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Ihre monatliche Zahlung: \$${(mortgageItem.loan / 100 * mortgageItem.percentage).toStringAsFixed(2)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "Bereits bezahlt: \$${(mortgageItem.loan / 10).toStringAsFixed(2)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(height: 10),
                                      const SizedBox(
                                        width: 150,
                                        height: 2,
                                        child: LinearProgressIndicator(
                                          value: 0.3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  mainColor),
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 11),
                      ),
                    ),
              const SizedBox(height: 35),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 1,
              ),
              const SizedBox(height: 35),
              Text(
                "Transaktionen",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 35),
              Consumer<MortgageController>(
                builder: (context, provider, child) {
                  List<Payment> allPayments = provider.getAllPayments();
                  print(allPayments);

                  return YourWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDate(DateTime dateTime) {
  // Use the `intl` package to format the date
  var formatter = DateFormat('dd MM yyyy');
  return formatter.format(dateTime);
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MortgageController provider = Provider.of<MortgageController>(context);
    List<Payment> allPayments = provider.getAllPayments();
    print(allPayments);

    return allPayments.isEmpty
        ? Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Noch keine Transaktionen",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 13),
                  ),
                  Text(
                    "Zukünftig werden Ihre Hypothekenzahlungen \n hier angezeigt",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          )
        : Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.separated(
                itemCount: provider.totalPaymentCount,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // Use a Column to display all the ListTile widgets vertically
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: bgColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.allPayments[index].mortgage!.name,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                '${formatDate(provider.allPayments[index].mortgage!.dateTime)} | 16:09',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            "- \$${provider.allPayments[index].payment}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: mainColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 50),
              ),
            ),
          );
  }
}
