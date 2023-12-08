import 'package:calculator/constants/colors.dart';
import 'package:calculator/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static Future<void> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  TextEditingController textField3Controller = TextEditingController();
  TextEditingController textField4Controller = TextEditingController();
  TextEditingController textField5Controller = TextEditingController();
  @override
  void initState() {
    loadSavedValues();

    super.initState();
  }

  Future<void> loadSavedValues() async {
    final prefs = await SharedPreferences.getInstance();
    textField1Controller.text =
        await prefs.getString('textField1Controller') ?? '';
    textField2Controller.text =
        await prefs.getString('textField2Controller') ?? '';
    textField3Controller.text =
        await prefs.getString('textField3Controller') ?? '';
    textField4Controller.text =
        await prefs.getString('textField4Controller') ?? '';
    textField5Controller.text =
        await prefs.getString('textField5Controller') ?? '';
    // Load saved values for the rest of your TextInputs
  }

  Future<void> saveValues() async {
    await PreferencesUtil.saveString(
        'textField1Controller', textField1Controller.text);
    await PreferencesUtil.saveString(
        'textField2Controller', textField2Controller.text);
    await PreferencesUtil.saveString(
        'textField3Controller', textField3Controller.text);
    await PreferencesUtil.saveString(
        'textField4Controller', textField4Controller.text);
    await PreferencesUtil.saveString(
        'textField5Controller', textField5Controller.text);
    // Save values for the rest of your TextInputs
  }

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
            // child: MyDynamicTextFieldList(),
            child: Column(
              children: [
                TextField(
                  controller: textField1Controller,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Bank',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: textField2Controller,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Accountnummer',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: textField3Controller,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'UIC',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: textField4Controller,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Korrespondenzkonto',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: textField5Controller,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Zahlungskommentar',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
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
            // ButtonsWidget(mortgageID: mortgageItem.id),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    // mortgage.deleteMortgage(mortgageItem)
                    saveValues();
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
                          .copyWith(color: bgColor),
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

 

// class MyDynamicTextFieldList extends StatelessWidget {
//   final List<String> hintTexts = [
//     'Bank',
//     'Accountnummer',
//     'UIC',
//     'Korrespondenzkonto',
//     'Zahlungskommentar',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: hintTexts.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: MyTextField(hintText: hintTexts[index]),
//         );
//       },
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   final String hintText;

//   const MyTextField({required this.hintText});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.only(left: 16.0),
//         border: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         labelText: hintText,
//         hintStyle: Theme.of(context)
//             .textTheme
//             .titleSmall!
//             .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
//         floatingLabelBehavior: FloatingLabelBehavior.never,
//       ),
//     );
//   }
// }
