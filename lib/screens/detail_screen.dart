import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
          "EINZELHEITEN",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyDynamicTextFieldList(),
          ),
        ),
      ),
    );
  }
}

class MyDynamicTextFieldList extends StatelessWidget {
  final List<String> hintTexts = [
    'Bank',
    'Accountnummer',
    'UIC',
    'Korrespondenzkonto',
    'Zahlungskommentar',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hintTexts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: MyTextField(hintText: hintTexts[index]),
        );
      },
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hintText;

  const MyTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
