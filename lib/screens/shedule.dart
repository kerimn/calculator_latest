import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key, this.data});

  final data;

  String formatDate(DateTime dateTime) {
    var formatter = DateFormat('dd MM yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    MortgageController provider = Provider.of<MortgageController>(context);
    var mortgage = context.read<MortgageController>();
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
          "ZEITPLAN",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: bgColor,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Text(
                              "Datum",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Text(
                              "Menge",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Text(
                              "Schulden",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(
                      provider.myCredit(data).length,
                      (index) => TableRow(
                        decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.yellow.shade50
                                : Colors.white),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                '${formatDate(provider.myCredit(data)[index].mortgage!.dateTime)}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                '${(((mortgage.allPayments[index].mortgage!.loan + (mortgage.allPayments[index].mortgage!.loan / 100) * mortgage.allPayments[index].mortgage!.percentage) / mortgage.allPayments[index].mortgage!.month)).toStringAsFixed(2)}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                '${(mortgage.allPayments[index].mortgage!.loan - (((mortgage.allPayments[index].mortgage!.loan + (mortgage.allPayments[index].mortgage!.loan / 100) * mortgage.allPayments[index].mortgage!.percentage) / mortgage.allPayments[index].mortgage!.month)) * (index + 1)).toStringAsFixed(2)}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
