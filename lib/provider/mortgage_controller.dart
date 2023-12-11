import 'dart:collection';
import 'package:calculator/data/mortgage_model.dart';
import 'package:calculator/data/payment.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MortgageController extends ChangeNotifier {
  final List<Mortgage> _items = [];
  Random random = Random();
  UnmodifiableListView<Mortgage> get items => UnmodifiableListView(_items);

  int get totalPaymentCount =>
      _items.fold<int>(0, (count, mortgage) => count + (mortgage.paymentCount));

  UnmodifiableListView<Payment> get allPayments =>
      UnmodifiableListView(getAllPayments());

  List<Payment> myCredit(int id) {
    List<Payment> allPayments = [];
    for (var mortgage in _items) {
      if (mortgage.id == id) {
        allPayments.addAll(mortgage.payment ?? []);
      }
    }

    List<Payment> reversedallPayments = allPayments.reversed.toList();

    return reversedallPayments;
    ;
  }

  List<Payment> getAllPayments() {
    // Create a flat list of all payments across all mortgages
    List<Payment> allPayments = [];
    for (var mortgage in _items) {
      allPayments.addAll(mortgage.payment ?? []);
    }
    List<Payment> reversedallPayments = allPayments.reversed.toList();

    return reversedallPayments;
  }

  String nameFieldValue = '';
  String loanFieldValue = '';
  String percentageFieldValue = '';
  String monthFieldValue = '';
  String firstPaymentValue = '';
  double paymentFieldValue = 0.0;

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
    // payments.remove(mortgage);
    _items.remove(mortgage);
    notifyListeners();
  }

  void addPaymentById(int mortgageId) {
    // Find the mortgage with the given ID
    Payment payment1 = Payment(id: mortgageId, payment: paymentFieldValue);
    Mortgage mortgage =
        _items.firstWhere((mortgage) => mortgage.id == mortgageId);
    // mortgage.payment = [payment1];

    payment1.associateWithMortgage(mortgage);

    // Notify listeners
    print("${mortgage.payment} / ${mortgage.payment}");
    notifyListeners();
  }

  void updatePaymentFieldValue(double value) {
    // print(paymentFieldValue);
    paymentFieldValue = value;

    // _items[indexAdd].payment!.add(value);
    // _payments.add(value);
    // _indexList.add(indexAdd);
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
