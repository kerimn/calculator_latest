import 'dart:collection';
import 'package:calculator/data/mortgage_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MortgageController extends ChangeNotifier {
  final List<Mortgage> _items = [];
  Random random = Random();
  UnmodifiableListView<Mortgage> get items => UnmodifiableListView(_items);

  final List<double> _payments = [];
  final List<int> _indexList = [];
  UnmodifiableListView<double> get payments => UnmodifiableListView(_payments);
  UnmodifiableListView<int> get indexList => UnmodifiableListView(_indexList);

  String nameFieldValue = '';
  String loanFieldValue = '';
  String percentageFieldValue = '';
  String monthFieldValue = '';
  String firstPaymentValue = '';
  double? paymentFieldValue = 0.0;

  int index(int search) {
    return _items.indexWhere((model) => model.id == search);
  }

  void addMortgage() {
    _items.add(
      Mortgage(
        id: random.nextInt(1000),
        name: nameFieldValue,
        loan: double.parse(loanFieldValue),
        percentage: int.parse(percentageFieldValue),
        month: int.parse(monthFieldValue),
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void deleteMortgage(Mortgage mortgage) {
    _items.remove(mortgage);
    notifyListeners();
  }

  void addPaymentById(int mortgageId) {
    // Find the mortgage with the given ID
    Mortgage mortgage =
        _items.firstWhere((mortgage) => mortgage.id == mortgageId);

    // Notify listeners
    print("${mortgage.id} / ${mortgage.payment}");
    notifyListeners();
  }

  void updatePaymentFieldValue(int item, double value) {
    // print(paymentFieldValue);
    paymentFieldValue = value;
    print(paymentFieldValue);
    int indexAdd = index(item);

    // _items[indexAdd].payment!.add(value);
    _payments.add(value);
    _indexList.add(indexAdd);
    // print(_items[indexAdd]);
    notifyListeners();
  }

  void updateNameFieldValue(String value) {
    nameFieldValue = value;
    notifyListeners();
  }

  void updateLoanFieldValue(String value) {
    loanFieldValue = value;
    notifyListeners();
  }

  void updatePercentageFieldValue(String value) {
    percentageFieldValue = value;
    notifyListeners();
  }

  void updateMonthFieldValue(String value) {
    monthFieldValue = value;
    notifyListeners();
  }

  void updateFirstPaymentValue(String value) {
    firstPaymentValue = value;
    notifyListeners();
  }
}
