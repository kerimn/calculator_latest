import 'package:calculator/data/mortgage_model.dart';

class Payment {
  int id;
  double payment;
  Mortgage? mortgage;

  Payment({required this.id, required this.payment, this.mortgage});

  void associateWithMortgage(Mortgage mortgage) {
    this.mortgage = mortgage;
    mortgage.payment ??= [];
    mortgage.payment!.add(this);
  }
}
