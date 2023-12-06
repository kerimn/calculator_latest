import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:calculator/provider/mortgage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key, required this.mortgageID});

  final int mortgageID;

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          "ADD PAYMENT",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 60),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введите сумму',
                        hintStyle: const TextStyle(fontSize: 20),
                        prefixIcon: Text(
                          '\$ ',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 60),
                        ),
                      ),
                      onChanged: (value) {
                        print(_controller.text);
                        mortgage.updatePaymentFieldValue(
                            double.parse(_controller.text));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // print(mortgage.firstPaymentValue.runtimeType);
                    // mortgage.updatePaymentFieldValue(
                    //     double.parse(_controller.text));
                    mortgage.addPaymentById(widget.mortgageID);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'ADD LOAN',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: bgColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
