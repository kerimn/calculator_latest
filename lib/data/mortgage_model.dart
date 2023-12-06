import 'package:calculator/data/payment.dart';

class Mortgage {
  int id;
  String name;
  double loan;
  int percentage;
  int month;
  DateTime dateTime;
  List<Payment>? payment;

  Mortgage({
    required this.id,
    required this.name,
    required this.loan,
    required this.percentage,
    required this.month,
    required this.dateTime,
    this.payment,
  });

  int get paymentCount => payment?.length ?? 0;
}
