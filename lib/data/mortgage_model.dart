class Mortgage {
  int id;
  String name;
  double loan;
  int percentage;
  int month;
  DateTime dateTime;
  double? payment;

  Mortgage({
    required this.id,
    required this.name,
    required this.loan,
    required this.percentage,
    required this.month,
    required this.dateTime,
    this.payment,
  });
}
